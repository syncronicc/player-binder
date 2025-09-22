local ReplicatedStorage=game:GetService('ReplicatedStorage')
local RunService=game:GetService("RunService")
local Players=game:GetService("Players")

local Packages=ReplicatedStorage.Packages

local Client=Players.LocalPlayer

local Signal=require(script.Signal)

local binder={}

function binder.BindPlayerAdded()
	local new=Signal.new()
	
	Players.PlayerAdded:Connect(function(plr)
		new:Fire(plr,true)
	end)
	Players.PlayerRemoving:Connect(function(plr)
		new:Fire(plr,false)
	end)
	
	for _,plr in Players:GetPlayers()do
		new:Fire(plr,true)
		
		task.wait()
	end
	
	return new
end
function binder.BindCharacterAdded()
	local added={}
	local new=Signal.new()
	
	binder.BindPlayerAdded():Connect(function(player,state)
		if state==false then
			if added[player] then
				added[player]:Disconnect()
				added[player]=nil
			end
		else
			new:Fire(player,(player.Character or player.CharacterAdded:Wait()))
			
			added[player]=player.CharacterAdded:Connect(function(char)
				new:Fire(player,char)
			end)
		end
	end)
	
	return new
end

return binder

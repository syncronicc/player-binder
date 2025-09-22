# Player Binder
> A compact binder that tracks whenever a player joins/leaves or the character gets added/removed. It also send all the players / characters at once as a solution for when the server doesnt load fast enough.
# Usage

### <ind>Player Added</ind>
``` LuaU

local binder=require(hierarchy.path.module)

binder.BindPlayerAdded():Connect(function(player:Player,state:boolean)
    print(`{player.Name} has {state==true and'joined'or'left' the game!`)
end)
```
### <ind>Character Added</ind>
``` LuaU

local binder=require(hierarchy.path.module)

binder.BindCharacterAdded():Connect(function(player:Player,character:Model?)
    print(`A new character has spawned! [ {character.Name} ]`
end)
```

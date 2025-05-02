Oldnamecall = hookmetamethod(game,"__namecall",function(self,...) 
    local Method = getnamecallmethod()

    if Method == "Kick" then 
        return
    end

    if getnamecallmethod() == "FireServer" then 
        local Args = {...}

        if self.Name == "UseRock" and not Args[1] then 
            return
        end

        if self.Name == "ItemUnequipped" and Args[1] == "DETECTION 3" then 
            return
        end
    end

    return Oldnamecall(self,...)
end)

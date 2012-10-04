function ICC_Buffs(event, plr)
	pRace = plr:GetPlayerRace()

	if pRace == 2 or pRace == 5 or pRace == 6 or pRace == 8 or pRace == 10 then
		pRace = "H"
	else
		pRace = "A"
	end

	if (plr:GetMapId() == 631) then
		if (plr:HasAura(69127) == false) then
			plr:CastSpell(69127)
			if(pRace == "H") then
				plr:CastSpell(73822)
			elseif(pRace == "A") then
				plr:CastSpell(73828)
			end
		end
	else
		if (plr:GetMapId() ~= 631) then
			if (plr:HasAura(69127) == true) then
				plr:RemoveAura(69127)
				if(pRace == "H") then
					plr:RemoveAura(73822)
				elseif(pRace == "A") then
					plr:RemoveAura(73828)
				end
			end
		end
	end
end

RegisterServerHook(4, "ICC_Buffs")


function Player_OnEnterWorld(event, plr)
	if plr:HasAura(69127) == true then
		plr:RemoveAura(69127)
	end
	if plr:GetMapId() == 631 then
		if (plr:HasAura(69127) == false) then
			SetDBCSpellVar(69127, "c_is_flags", 0x01000)
			plr:CastSpell(69127)
		end
	end
end
RegisterServerHook(4, "Player_OnEnterWorld")
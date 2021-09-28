RegisterServerEvent("lrp:GetVehicleFromGarage")
AddEventHandler("lrp:GetVehicleFromGarage", function(player, coords, plate, spotcoords)
  local LocationHash = GetHashKey(coords.x .. coords.y .. coords.z)
  MySQL.Async.fetchAll('SELECT * FROM lrp_garages WHERE plate = @plate AND garage = @coords AND isout = 0 LIMIT 1', {
    ['@coords'] = LocationHash,
    ['@plate']  = plate
  }, function(result)
    if result[1] then
      result[1]['coords'] = spotcoords
      TriggerClientEvent('lrp:SpawnVehicle', player, result[1])
      SetVehicleIsOut(plate)
    end
  end) 
end)

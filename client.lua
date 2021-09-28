RegisterNUICallback('drive', function(data)
  local lcoords = json.decode(data.garage_coords)
  local coords = vector3(lcoords.x, lcoords.y, lcoords.z)
  local SpotCoords = GetUnoccupiedSpot(coords)
  TriggerServerEvent('lrp:GetVehicleFromGarage', GetPlayerServerId(GetPlayerIndex()), coords, data.plate, SpotCoords)
  UIDisplay = false
  SetNuiFocus(false, false)
  SendNUIMessage({
    type = "ui",
    display = false
  })
end)

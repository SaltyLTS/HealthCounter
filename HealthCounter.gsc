#include maps/mp/_utility;
#include common_scripts/utility;
#include maps/mp/gametypes_zm/_hud_util;
#include maps/mp/zombies/_zm;
#include maps/mp/zombies/_zm_utility;
#include maps/mp/zombies/_zm_weapons;
#include maps/mp/zombies/_zm_stats;
#include maps/mp/gametypes_zm/_hud_message;
#include maps/mp/zombies/_zm_powerups;
#include maps/mp/zombies/_zm_perks;
#include maps/mp/zombies/_zm_audio;
#include maps/mp/zombies/_zm_score;

init() {
  level thread onplayerconnect();
}

onplayerconnect() {
  for (;;) {
    level waittill("connecting", player);
    player thread healthPlayer();
  }
}

healthPlayer() {
  self endon("disconnect");
  
  if(isDefined(self.healthText))
    return;

  self.healthText = createFontString("hudsmall", 1.9);
  self.healthText setPoint("CENTER", "CENTER", "CENTER", 150);

  self.healthText.alpha = 1;
  self.healthText.glowAlpha = 1;

  while(true){
    if(isDefined(self.revivetrigger))
    {
      self.healthtext.glowcolor = (.850, 0, 0);
      self.healthText setText("^1Downed");
    }
    else
    {
      self.healthText setValue(self.health);
      self.healthText.label = &"Health : ^2";
      self.healthtext.glowcolor = (0, .573, 0);
    }
  wait 0.05;
  }
}
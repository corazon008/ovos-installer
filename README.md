# ovos-installer
Own script to install Opên Voice OS

## Prerequisites
```bash
sudo raspi-config
```

### Activer SSH, SPI, I2C, etc.
 
1. **SPI** :  
   Active SPI (Serial Peripheral Interface) dans **Interface Options** si tu souhaites utiliser des périphériques électroniques qui communiquent via ce protocole.

2. **Port série** :  
   - Si tu n'as pas besoin de la console série, désactive-la dans **Interface Options**.  
   - L'option **"hardware serial"** doit rester activée si tu utilises des périphériques qui nécessitent une communication série matérielle.

---

### Configurer les paramètres régionaux

1. **Locale** :  
   Configure la locale dans **Localisation Options**. Par exemple, pour le français, sélectionne `fr_FR.UTF-8`.

2. **Timezone (Fuseau horaire)** :  
   Configure le fuseau horaire dans **Localisation Options** pour qu'il corresponde à ta localisation (par exemple, Europe/Paris).

## How to use
```bash
git clone https://github.com/corazon008/ovos-installer.git && cd ovos-installer && sudo bash ovos-installer.sh
```

```bash
sudo reboot
```

```bash
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/OpenVoiceOS/ovos-installer/main/installer.sh)"
```
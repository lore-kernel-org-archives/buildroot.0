From: Matthew Dombroski <matthew.dombroski@gmail.com>
Date: Thu, 26 Jun 2008 16:50:38 +1200
Subject: [Buildroot] AC97 audio on AT91SAM9263
Message-ID: <408540dd0806252150g2c5bd43bxd4a72f248dbab136@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Has anyone here got the AC97 audio on the AT91 series working?
I am using the experimental driver from
http://www.linux4sam.org/twiki/bin/view/Linux4SAM/LinuxKernel#2_6_24_at91_exp_patch

The driver compiles, runs but alsa utils all fail with some IOCTL error.
alsamixer: function snd_mixer_load failed: Inappropriate ioctl for device
alsactl: get_control:259: Cannot read control '2,0,0,Master Playback
Switch,0': Inappropriate ioctl for device

I am using a buildroot snapshot (about a month old) and linux 2.6.24
(at91 + at91-exp patches)

~Matthew

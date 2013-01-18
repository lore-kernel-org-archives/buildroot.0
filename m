From: Viallard Anthony <viallard@syscom-instruments.com>
Date: Fri, 18 Jan 2013 12:18:08 +0100
Subject: [Buildroot] QUILT helper
Message-ID: <50F92F70.2070808@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

It will be nice having a quilt helper like openwrt has.

  QUILT=1 make ofono

Et voil?, with this command, builroot use quilt to apply patches. So, if 
you need to edit a patch, you just go in the build dir, use quilt pop, 
quilt refresh, quilt push -a and use a new command to update the eddited 
patch :

  make ofono-refresh

I known christmas was few days ago but if you include this idea, I will 
be happy like when santa claus gave me a SEGA master system.

Best regards,
avd.

-- 
.-------------------.-----------------------.-------------------.
| Viallard Anthony  | Syscom Instruments SA | Embedded System   |
| +41 024 455 24 82 | Rue de l'industrie 21 | Software Designer |
| ~~~~~~~~~~~~~~~~~ | 1450 Sainte-Croix     | ~~~~~~~~~~~~~~~~~ |
'-------------------^-----------------------^-------------------^

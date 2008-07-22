From: Matuschka, Sebastian <Sebastian.Matuschka@gcd-solutions.de>
Date: Tue, 22 Jul 2008 11:48:39 +0200
Subject: [Buildroot] After make clean u-boot isn't recompiled
Message-ID: <49ED01FC03EE524BB7BB258E8F93BFF32652FE@bfl-exchange-1.BFL.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

everytime i do a 'make clean' in the buildroot root i must compile
u-boot manually, everything else is compiled by make, except u-boot. I
have a symbolic link in /usr/bin to the mkimage in u-boot, and the
mkimage binary is deleted by clean. U-boot isn't recompiled and the
kernel fails to make an uImage.
I'm not (yet) very familiar with buildroot so I can't send a patch, but
I guess it's just a little change in a script.
Btw: Many thanks for this great tool.
Regards
Sebastian

From: Dirk Vermaak <dirk.vermaak@ntlworld.com>
Date: Wed, 23 Jul 2008 11:14:37 +0100
Subject: [Buildroot] UDEV-114 : Has it changed?
Message-ID: <200807231114.37318.dirk.vermaak@ntlworld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

I suddenly have a problem with building under Buildroot. At about 10.30GMT 
UDEV-114 suddenly broke during a build and now seems to not build due to 
directories being missing etc.

Did it suddenly change today?

------------------------------------------------------------------------------------------------------------------------------------------------------------------
/usr/bin/install -m 
0755 -D /home/dirk/diarre/linux/build6/buildroot/build_arm/udev-114/extras/volume_id/vol_id /home/dirk/diarre/linux/build6/buildroot/project_build_arm/at91sam9260dfc/root/lib/udev/vol_id
/usr/bin/install: cannot stat 
`/home/dirk/diarre/linux/build6/buildroot/build_arm/udev-114/extras/volume_id/vol_id': 
No such file or directory
make: *** 
[/home/dirk/diarre/linux/build6/buildroot/project_build_arm/at91sam9260dfc/root/lib/udev/vol_id] 
Error 1

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Thanks,

Dirk Vermaak

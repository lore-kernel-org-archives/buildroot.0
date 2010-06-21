From: =?ISO-8859-1?Q?P=E9ter_St=F3sz?= <peter.stosz@mentat.hu>
Date: Mon, 21 Jun 2010 22:49:35 +0200
Subject: [Buildroot] Missing UBIFS utils
Message-ID: <AANLkTilpYe-9Mk_hZNpeTBGF8YwFAfyW6hBCl2G2OXJd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

How can I make UBI utils to the target?
Config below.
Found the needed utils on the host/usr/sbin directory, but not exist on
target/... dir.


BR2010.05
Target: SAM9261
Host: Ubuntu10.04

BR2_PACKAGE_MTD=y
...
BR2_PACKAGE_MTD_MTDINFO=y
BR2_PACKAGE_MTD_UBIATTACH=y
BR2_PACKAGE_MTD_UBICRC32=y
BR2_PACKAGE_MTD_UBIDETACH=y
BR2_PACKAGE_MTD_UBIFORMAT=y
BR2_PACKAGE_MTD_UBIMKVOL=y
BR2_PACKAGE_MTD_UBINFO=y
BR2_PACKAGE_MTD_UBINIZE=y
BR2_PACKAGE_MTD_UBIRENAME=y
BR2_PACKAGE_MTD_UBIRMVOL=y
BR2_PACKAGE_MTD_UBIRSVOL=y
BR2_PACKAGE_MTD_UBIUPDATEVOL=y


BR

Peter
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100621/454ed75d/attachment.html>

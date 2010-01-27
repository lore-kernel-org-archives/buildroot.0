From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed, 27 Jan 2010 02:08:48 +0100
Subject: [Buildroot] [PATCH 00/19] Pull request: Fixes concerning unstripped
	target, external toolchains and some conversions...
Message-ID: <1264554547-9009-1-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm resending those patchs, some of them are updated/new...
Any comment are more than welcome. There are some patch I'm not sure of...
At least it fixes issues on my side, I hope it doesn't trigger other ones.

The list :
   [PATCH 01/19] zlib: fix headers installation in target directory
   [PATCH 02/19] flex: fix prog-ar patch
   [PATCH 03/19] flex: bump to 2.5.35
   [PATCH 04/19] flex: convert to autotools infrastructure
   [PATCH 05/19] gperf: convert to autotools infrastructure
   [PATCH 06/19] bash: remove CC variable when calling make
   [PATCH 07/19] bash: fix configuration
   [PATCH 08/19] ncurses: convert to autotools infrastructure
   [PATCH 09/19] ncurses: fix path to patch ncurses5-config
   [PATCH 10/19] readline: convert to autotools infrastructure
   [PATCH 11/19] lua: conversion to new package infrastructure
   [PATCH 12/19] Rework icu package on top of the generic infrastructure
   [PATCH 13/19] package: Added post uninstall hooks
   [PATCH 14/19] libxslt: fix dependency on libxml
   [PATCH 15/19] dbus: fix target installation with BR2_HAVE_DEVFILES
   [PATCH 16/19] package: fix unstripped binary installation
   [PATCH 17/19] package: fix install without strip
   [PATCH 18/19] external toolchain: fix strip of libraries
   [PATCH 19/19] ext-toolchain: remove pkgconfig files from the external toolchain

--
Lionel Landwerlin

From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun,  7 Feb 2010 17:55:32 +0100
Subject: [Buildroot] [PATCH 00/10] Pull-request: A few fixes and conversions
	to new package infrastructure
Message-ID: <1265561742-5924-1-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Last fixes for 2010.02, I don't know if conversions are relevant so
close of the release...

Available at :
          git://git.potipota.net/buildroot various-fixes

The list :
[PATCH 01/10] ncurses: convert to autotools infrastructure
[PATCH 02/10] ncurses: fix path to patch ncurses5-config
[PATCH 03/10] lua: conversion to new package infrastructure
[PATCH 04/10] package: Add $(HOST_DIR)/usr/lib to LD_LIBRARY_PATH for make & configure env variables
[PATCH 05/10] Rework icu package on top of the generic infrastructure
[PATCH 06/10] package: Added post uninstall hooks
[PATCH 07/10] package: fix install without strip
[PATCH 08/10] external toolchain: fix strip of libraries
[PATCH 09/10] ext-toolchain: remove pkgconfig files from the external toolchain
[PATCH 10/10] scripts: force copy of files to erase already present and readonly files

Regards,

--
Lionel Landwerlin

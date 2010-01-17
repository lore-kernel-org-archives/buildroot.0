From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun, 17 Jan 2010 23:40:48 +0100
Subject: [Buildroot] [pull request] Various fixes and new infrastructure
	conversion
Message-ID: <1263768063-24133-1-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is a patch list containing fixes and conversions to the new
infrastructure :

[PATCH 01/15] flex: fix prog-ar patch
[PATCH 02/15] flex: bump to 2.5.35
[PATCH 03/15] flex: convert to autotools infrastructure
[PATCH 04/15] gperf: convert to autotools infrastructure
[PATCH 05/15] bash: remove CC variable when calling make
[PATCH 06/15] bash: fix configuration
[PATCH 07/15] ncurses: convert to autotools infrastructure
[PATCH 08/15] ncurses: fix path to patch ncurses5-config
[PATCH 09/15] readline: convert to autotools infrastructure
[PATCH 10/15] lua: conversion to new package infrastructure
[PATCH 11/15] Rework icu package on top of the generic infrastructure
[PATCH 12/15] package: Added post uninstall hooks
[PATCH 13/15] libxslt: fix dependency on libxml
[PATCH 14/15] dbus: fix target installation with BR2_HAVE_DEVFILES
[PATCH 15/15] external toolchain: fix strip of libraries

Changes are available in the git repository at:

  git://git.potipota.net/buildroot various-fixes

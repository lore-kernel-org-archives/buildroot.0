From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 5 Feb 2009 17:10:34 +0100
Subject: [Buildroot] [patch] mplayer: bump to v1.0rc2
Message-ID: <20090205171034.341e8a1c@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

The attached patch bumps mplayer to v1.0rc2. I am unsure if any of the
following patches needs to be converted as well:

mplayer-1.0rc1-largefile.patch
mplayer-1.0rc1-ppc-configure.patch
mplayer-1.0rc1-remove-sys-timeb.patch

The other patches in SVN are not needed for v1.0rc2. This patch also
contains the Atmel vendor patch to give a boost on AVR32 devices.

-- 
Best regards,
Hans-Christian Egtvedt
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mplayer-bump-v1.0rc2.patch
Type: text/x-patch
Size: 218159 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090205/85e4438e/attachment-0001.bin>

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Dec 2010 01:35:41 +0100
Subject: [Buildroot] [git commit master 1/1] mplayer: convert to gentargets,
	bump to a recent SVN version
Message-ID: <20101214003644.3F05E82927@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6bcedeed375c3504d4d6f82fca020790866e2c6e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on the conversion to gentargets done by Martin Banky, several
issues were fixed, and the mplayer package was improved:

 * Updated to a recent SVN version

 * Removed mandatory dependency on libmad

 * The AVR32 specific patch has been removed. It was a pain to remain
   blocked at the old 1.0-rc2 just for this patch. All this
   optimization work should have been submitted upstream, Buildroot is
   not the place to carry such heavy modifications.

 * Options were added to select whether mplayer and/or mencoder should
   be built/installed.

 * Support for additional options if packages have been selected:
   tremor, libmad, libtheora, libpng, jpeg, xlib_libX11,
   xlib_libXv. More could be added in the future.

 * Support for ARM-related optimization options. Similar improvements
   could be done for x86 and PowerPC architectures.

[Peter: fix build with !IPV6]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Patch is too large, so refusing to show it

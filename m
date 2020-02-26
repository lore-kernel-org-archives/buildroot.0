From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2020 19:04:04 +0100
Subject: [Buildroot] [PATCH/next] package/psplash: bump to revision
 fd33a9b
In-Reply-To: <1582733006-22049-1-git-send-email-pjtexier@koncepto.io>
 (Pierre-Jean Texier's message of "Wed, 26 Feb 2020 17:03:26 +0100")
References: <1582733006-22049-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <875zft5ip7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pierre-Jean" == Pierre-Jean Texier <pjtexier@koncepto.io> writes:

 > This includes the following changes:
 > 66c8f65 Makefile.am: use BUILT_SOURCES instead of BUILD_SOURCES
 > f7a354d Generate image headers from their PNG source, while still including them in dist tarball
 > 983837e Import png source for images, extracted from headers
 > 3bd1557 Cleanup poky logo
 > 773a397 Add configure flags for fullscreen logo and no startup message
 > 2913c24 Double buffering support
 > 8188d68 Support --with-font configure option to use other font headers
 > 88c4b71 Add SPDX License information to files, drop boilerplate
 > 904f4aa add systemd support
 > e94bd11 process consecutive commands
 > 568f28e use /run for communication FIFO
 > ee053e0 add recovered bar.png
 > 2015f70 Fix text width calculation.

 > Also:
 >  - remove the 'psplash-quit.service' unit file
 >  - add 'psplash-systemd.service' to use the new systemd support in psplash

 > Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard

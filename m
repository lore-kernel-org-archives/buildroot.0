From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 15 Aug 2014 11:03:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: prevent stripping the
	ffmpeg binary
In-Reply-To: <1407674806-11614-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sun, 10 Aug 2014 14:46:46 +0200")
References: <1407674806-11614-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <871tsi3z0o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Packages shouldn't strip executables by themselves, so that Buildroot
 > controls whether stripping should occur or not. This also fixes the
 > build on Blackfin FLAT where stripping actually doesn't work because
 > stripping FLAT binaries is not supported.

 > Inspired by Thomas:
 > http://git.buildroot.net/buildroot/commit/package/hdparm/hdparm.mk?id=11dbb615338cd768acc2c3138064ddf557e9b60b

 > Fixes
 > http://autobuild.buildroot.net/results/581/581c43b50c9717e53334eb156ece95fe499ccb04/
 > http://autobuild.buildroot.net/results/57a/57a1bdc22b803114c018fa007884385bf8355151/
 > http://autobuild.buildroot.net/results/d8a/d8a1aadebd302abc923bc4865e1242ab2479d641/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:52:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server:
 security bump version to 1.20.9
In-Reply-To: <20200828061858.878475-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 28 Aug 2020 08:18:58 +0200")
References: <20200828061858.878475-1-bernd.kuhls@t-online.de>
Message-ID: <87tuwmmzej.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes CVE-2020-14345, CVE-2020-14346, CVE-2020-14361 & CVE-2020-1436:
 > https://lists.x.org/archives/xorg-announce/2020-August/003058.html

 > Removed patch 0002, not needed anymore due to upstream commit
 > https://cgit.freedesktop.org/xorg/xserver/commit/configure.ac?h=server-1.20-branch&id=c601c8faf54ff9e3bcbc653421828d71042deef7

 > Build-tested with wayland:
 > checking for a useful monotonic clock ......
 > checking whether CLOCK_MONOTONIC is declared... yes
 > guessing yes

 > Removed patch 0007, included in upstream release.

 > Rebased and renumbered remaining patches.

 > Reformatted license hashes.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard

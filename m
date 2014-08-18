From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Aug 2014 11:05:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/gutenprint: replaces -static
	with -static-libtool-libs
In-Reply-To: <1408314958-32002-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Mon, 18 Aug 2014 00:35:58 +0200")
References: <1408314958-32002-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <8738cuw4kr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > gutenprint rely on the original behaviour of -static, but since commit
 > in buildroot "support/libtool: make -static behave like -all-static" [1],
 > the build of genppd is broken.

 > genppd need to be build statically otherwise the following warning appears:
 > ***WARNING: Use of --disable-static-genppd or --disable-static
 >             when building CUPS is very dangerous.  The build may
 >             fail when building the PPD files, or may *SILENTLY*
 >             build incorrect PPD files or cause other problems.
 >             Please review the README and release notes carefully!

 > [1] http://git.buildroot.net/buildroot/commit/?id=97703978ac870ce2b14ad144f8e082de82aa2c64

 > Fixes:
 > http://autobuild.buildroot.net/results/55f/55f78104d7a5d11baf5650ac12aaa1b23c2b7743/build-end.log
 > http://autobuild.buildroot.net/results/fc8/fc8cfe3f27ceaca70c7471c44305317c66cb0eea/build-end.log

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard

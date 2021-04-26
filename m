From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 23:14:12 +0200
Subject: [Buildroot] [git commit] package/libcamera: disable package
 affected by binutils bug 27597
In-Reply-To: <20210426192739.8A79A7FE79@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Mon, 26 Apr 2021 21:54:21 +0200")
References: <20210426192739.8A79A7FE79@busybox.osuosl.org>
Message-ID: <87y2d4eokb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=479b09366cca3d4d697d221c5e347e5ab470ebcd
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This package is affected by binutils bug 27597 and no work around has
 > been found, so let's disable it if
 > BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597=y.

 > Fixes:
 > http://autobuild.buildroot.net/results/8ac/8ac599392f773eecff4773393ef0d0232a22f372/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard

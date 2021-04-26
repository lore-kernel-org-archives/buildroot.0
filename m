From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 23:14:19 +0200
Subject: [Buildroot] [git commit] package/kf5-kcoreaddons: disable
 package affected by binutils bug 27597
In-Reply-To: <20210426192739.7D40184080@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Mon, 26 Apr 2021 21:52:52 +0200")
References: <20210426192739.7D40184080@busybox.osuosl.org>
Message-ID: <87tunseok4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=73745ef03bcc729121cc5447d466d04cb948c80a
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This package is affected by binutils bug 27597 and no work around has
 > been found, so let's disable it if
 > BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597=y.

 > Fixes:
 > http://autobuild.buildroot.net/results/0c1/0c1e7e094b0990970f28cda2be0e3fe7d82ce6a2/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard

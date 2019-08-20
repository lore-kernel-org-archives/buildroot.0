From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Aug 2019 21:21:47 +0200
Subject: [Buildroot] [PATCH] package/proj: fix build failure due to gcc
 bug 68485
In-Reply-To: <20190625064436.23113-1-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Tue, 25 Jun 2019 08:44:36 +0200")
References: <20190625064436.23113-1-giulio.benetti@micronovasrl.com>
Message-ID: <87d0gz7id0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > The proj package exhibits gcc bug 68485 when built for the Microblaze
 > architecture with optimization enabled, which causes a build failure.

 > As done for other packages in Buildroot work around this gcc bug by
 > setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_68485=y.

 > Fixes:

 > http://autobuild.buildroot.net/results/e61/e61bd55067071415223e523a81de3c2e9cafea6f/

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard

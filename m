From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Aug 2019 21:23:26 +0200
Subject: [Buildroot] [PATCH] package/git: work around gcc bug 85180
In-Reply-To: <20190625070254.31868-1-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Tue, 25 Jun 2019 09:02:54 +0200")
References: <20190625070254.31868-1-giulio.benetti@micronovasrl.com>
Message-ID: <878srn7ia9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > With Microblaze Gcc version < 8.x the build hangs due to gcc bug
 > 85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
 > shows up when building git with optimization but not when building with
 > -O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we force
 > using -O0.

 > Fixes:

 >   http://autobuild.buildroot.net/results/7ad/7adff001631053ae5a3cb3e176d321f6a2d3cceb/

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard

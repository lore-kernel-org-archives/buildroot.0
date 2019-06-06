From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 17:05:05 +0200
Subject: [Buildroot] [PATCH v2 03/12] package/chocolate-doom: fix
 BUG_85180 build timeout
In-Reply-To: <20190521133932.81841-4-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Tue, 21 May 2019 15:39:23 +0200")
References: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
 <20190521133932.81841-4-giulio.benetti@micronovasrl.com>
Message-ID: <87h892kb4u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > With Microblaze Gcc version < 8.x build hangs on compiling last files
 > before linking.
 > This is due to bug 85180:
 > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
 > Bug shows up building chocolate-doom with optimization but not when
 > building with -O0.

 > If BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y force using -O0 passing it to
 > CFLAGS.

 > Fixes:
 > http://autobuild.buildroot.net/results/e57/e570839576be8963dc6bd36342e2f857da3c6146/

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard

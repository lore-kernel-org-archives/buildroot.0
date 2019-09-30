From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 14:26:55 +0200
Subject: [Buildroot] [PATCH] package/protobuf: work around gcc bug 85180
In-Reply-To: <20190918091142.79696-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Wed, 18 Sep 2019 11:11:42 +0200")
References: <20190918091142.79696-1-giulio.benetti@benettiengineering.com>
Message-ID: <87tv8u3r74.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > With Microblaze Gcc version < 8.x the build hangs due to gcc bug
 > 85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
 > shows up when building protobuf with optimization but not when building
 > with -O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we
 > force using -O0.

 > Fixes:

 > http://autobuild.buildroot.net/results/73dc9610a13d6e14eec58d529617210d93d5dec4/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard

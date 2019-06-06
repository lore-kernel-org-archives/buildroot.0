From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 17:05:14 +0200
Subject: [Buildroot] [PATCH v2 04/12] package/ddrescue: fix BUG_85180
 build timeout
In-Reply-To: <20190521133932.81841-5-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Tue, 21 May 2019 15:39:24 +0200")
References: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
 <20190521133932.81841-5-giulio.benetti@micronovasrl.com>
Message-ID: <87d0jqkb4l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > With Microblaze Gcc version < 8.x build hangs on compiling first files.
 > This is due to bug 85180:
 > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
 > Bug shows up building ddrescue with optimization but not when building
 > with -O0.

 > If BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y force using -O0 passing it to
 > CXXFLAGS.

 > Fixes:
 > http://autobuild.buildroot.net/results/2af/2af69401acb76be3d3fd427d1c58fed3af33bf9b/

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard

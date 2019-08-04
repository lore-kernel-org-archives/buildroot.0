From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Aug 2019 22:14:18 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXfont: work
 around gcc bug 85180
In-Reply-To: <20190718211440.ED0BD83A24@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 18 Jul 2019 22:58:06 +0200")
References: <20190718211440.ED0BD83A24@busybox.osuosl.org>
Message-ID: <878ss8pu1x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=6910e723a916fd213cb3e2f7ca6c9680c460dee3
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > With Microblaze Gcc version < 8.x the build hangs due to gcc bug
 > 85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
 > shows up when building xlib_libXfont with optimization but not when
 > building with -O0. To work around this, if
 > BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we force using -O0.

 > Fixes:
 > http://autobuild.buildroot.net/results/7c6/7c64becbf06a1e00e41b7ddb95dd0c65bf364eb7/

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard

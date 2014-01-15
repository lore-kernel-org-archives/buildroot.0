From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 Jan 2014 15:30:33 +0100
Subject: [Buildroot] [PATCH v2 2/3] uclibc: xtensa: fix posix_spawn
	autoconf detection
In-Reply-To: <20140115133108.GP4602@tarshish> (Baruch Siach's message of "Wed, 
 15 Jan 2014 15:31:08 +0200")
References: <cover.1389594195.git.baruch@tkos.co.il>
 <dc000d1809a9e23ee01cfc2741341065cb5118e7.1389594195.git.baruch@tkos.co.il>
 <20140115133108.GP4602@tarshish>
Message-ID: <877ga1uxkm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi buildroot list,
 > On Mon, Jan 13, 2014 at 08:26:13AM +0200, Baruch Siach wrote:
 >> posix_spawn is a new feature in uClibc development branch. Move posix_spawn
 >> implementation from librt to libc so that gnulib can detect it correctly.
 >> 
 >> Fixes
 >> http://autobuild.buildroot.net/results/ab1/ab1250c3d402ec3fbaf22eeffd07de218ffafb22/.
 >> 
 >> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

 > Mike Frysinger has rejected this uclibc patch 
 > (http://article.gmane.org/gmane.comp.lib.gnulib.bugs/33613), but there is a 
 > different solution suggested for the coreutils build problem 
 > (http://article.gmane.org/gmane.comp.gnu.coreutils.general/4995). In the mean 
 > time I'm marking this patch as rejected in patchwork.

Ok, thanks for following up on it.

-- 
Bye, Peter Korsgaard

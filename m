From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 May 2015 23:38:11 +0200
Subject: [Buildroot] [PATCH] package/ipmiutil: disable parallel build
In-Reply-To: <1432395633-3506-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 23 May 2015 17:40:33 +0200")
References: <1432395633-3506-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87zj4tzmf0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > ipmiutil has a race when generating the object files and the executable,
 > because it uses very odd (to say the least) constructs in its
 > Makefile.am, leading to improper dependency-tracking.

 > Since impmiutil is pretty small, and because it is just mindbloggingly
 > complex to fix its Makefile.am, just disable parallel build.

 > Fixes:
 >     http://autobuild.buildroot.org/results/661/661373306d0440aaea67e394fbbfc47fd4481589/
 >     http://autobuild.buildroot.org/results/a6c/a6c5f9d8e0e0bad27b8ca1fa217bfda4216f2cd8/
 >     http://autobuild.buildroot.org/results/f0b/f0bbbd54349b5239872d6de185e16c1d90b3f779/
 >     http://autobuild.buildroot.org/results/20c/20c09695481c3d1030852330c1d1f1f9489f1f41/
 >     ...

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>
 > Cc: Romain Naour <romain.naour@openwide.fr>
 > Cc Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

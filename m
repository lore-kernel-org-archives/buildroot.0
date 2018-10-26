From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Oct 2018 10:34:44 +0200
Subject: [Buildroot] [PATCH] dc3dd: fix build with glibc 2.28
In-Reply-To: <22b17739faee5b85510a51f729cce065e7891c56.1540533580.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 26 Oct 2018 08:59:40 +0300")
References: <22b17739faee5b85510a51f729cce065e7891c56.1540533580.git.baruch@tkos.co.il>
Message-ID: <87pnvx5cnv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > gnulib code in dc3dd relied in internal glibc definitions that are no
 > longer visible with glibc 2.28. Add a patch based on upstream gnulib to
 > fix the build.

 > Fixes:
 > http://autobuild.buildroot.net/results/552/552b8e44fe6585f978e2fb7a920057a868cf6689/
 > http://autobuild.buildroot.net/results/00d/00d2bf5a4c97bea2ace0427c0bed57e11f9a5f9a/
 > http://autobuild.buildroot.net/results/17a/17a9246bfb034c531ec5e27e29d38857e58db271/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard

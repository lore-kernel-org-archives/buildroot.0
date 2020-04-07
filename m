From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Apr 2020 08:28:07 +0200
Subject: [Buildroot] [PATCH] package/localedef: add missing dependeny on
 host-gawk
In-Reply-To: <20200317220204.40127-1-romain.naour@gmail.com> (Romain Naour's
 message of "Tue, 17 Mar 2020 23:02:04 +0100")
References: <20200317220204.40127-1-romain.naour@gmail.com>
Message-ID: <87eeszstc8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > While reviewing the patch [1], we noticed that host-gawk dependency
 > was missing. I may trigger an issue if gawk is missing on the host
 > since it's a "critical tool" [2].
 > Indeed, localedef package is actually glibc sources that check gawk
 > host binary.
 > host-gawk is listed in glibc package dependency [3], so add it now.

 > [1] af90a104c06542a1bf5545eaf9b9c7beb7176e80
 > [2] https://sourceware.org/git/?p=glibc.git;a=blob;f=configure.ac;h=49b900c1ed68fa4dd1dadca809ceb6e8b237a89c;hb=9ea3686266dca3f004ba874745a4087a89682617#l1021
 > [3] https://git.buildroot.net/buildroot/tree/package/glibc/glibc.mk?h=2020.02#n38

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard

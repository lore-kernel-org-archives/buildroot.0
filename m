From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 15 Jul 2011 23:17:08 +0200
Subject: [Buildroot] [PATCH] toolchain/crosstool-NG: use the package
	infrastructure
In-Reply-To: <1310682247-9027-1-git-send-email-yann.morin.1998@anciens.enib.fr>
 (Yann E. MORIN's message of "Fri, 15 Jul 2011 00:24:07 +0200")
References: <1310682247-9027-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <87wrfj6y7f.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> Move crosstool-NG to package/ and make it an autotarget package.
 Yann> This requires a new patch (now upstream).

 Yann> Now, the crosstool-NG toolchain backend only contains enough to build
 Yann> the toolchain, there's no more reference to building crosstool-NG as
 Yann> a package.

Committed, thanks.

-- 
Bye, Peter Korsgaard

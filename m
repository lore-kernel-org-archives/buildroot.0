From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 09 Feb 2009 14:03:48 +0100
Subject: [Buildroot] Bug with gmp and mpfr
In-Reply-To: <498A642A.3060003@hq.tensilica.com> (Maxim Grigoriev's message of
	"Wed\, 04 Feb 2009 19\:59\:38 -0800")
References: <498A4C33.8000302@tsinghua.edu.cn>
	<498A642A.3060003@hq.tensilica.com>
Message-ID: <873aen92yz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxim" == Maxim Grigoriev <maxim@tensilica.com> writes:

 Maxim> Hello Vania,
 Maxim> The best solution for this problem I was able to find is
 Maxim> switching to static linkage of GMP/MPFR for GCC 4.3.x compilers.

 Maxim> If you don't like the idea of static linkage, please, simply ignore
 Maxim> this email.

Thanks, committed as r25269.

-- 
Bye, Peter Korsgaard

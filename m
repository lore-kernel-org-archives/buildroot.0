From: Elizabeth Oldham <beth@the-hug.org>
Date: Sat, 20 Oct 2007 10:15:28 +0100
Subject: [Buildroot] MIPS Crosstoolchain for MIPS24K with dsp amd 24k
 compiler options
In-Reply-To: <712862.82132.qm@web7908.mail.in.yahoo.com>
References: <712862.82132.qm@web7908.mail.in.yahoo.com>
Message-ID: <4719C730.3090007@the-hug.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sathesh babu wrote:

>   I tried with below combinations of
>   - GCC-4.2.1,GCC-4.0.1, GCC-4.1.0
>   - binutils-2.15, binutil-2.17,binutil-2.18 
>   -  uClibc-0.9.27 
>   but i couldn't succeed any of the above combinations.

Try gcc-4.2.0 binutils-2.17-50 and uClibc -0.9.28.

Alternatively you can download a timesys toolchain from 
ftp://ftp.mips.com/pub/tools/software/timesys/toolchains/LDE-3.00.00/


If you are just building a kernel and nothing else you can get away with 
the 'bare' gcc here: ftp://ftp.mips.com/pub/tools/software/sde-for-linux/


Beth

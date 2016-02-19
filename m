From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Feb 2016 17:44:55 +0100
Subject: [Buildroot] [PATCH 2/2] glibc: bump default to version 2.22
In-Reply-To: <56C73852.8000400@zacarias.com.ar>
References: <1455888754-10726-1-git-send-email-gustavo@zacarias.com.ar>
 <1455888754-10726-2-git-send-email-gustavo@zacarias.com.ar>
 <87y4aghfxm.fsf@dell.be.48ers.dk>
 <56C73852.8000400@zacarias.com.ar>
Message-ID: <20160219174455.0ebf17b9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Feb 2016 12:44:18 -0300, Gustavo Zacarias wrote:

> Big general question for everyone, we now have 3 versions of glibc (not 
> counting eglibc).
> The only reason for keeping 2.21 is sparc (< v9) support, which i think 
> doesn't make sense.
> The case for eglibc is somewhat similar, it's support for SPE FPU (e500*).
> Both are covered by uclibc so i think we could retire them.

Agreed. If glibc no longer supports sparc < v9 and doesn't support SPE
FPUs, then it's an upstream issue, and we shouldn't keep old stuff
around because of this. People interested by those features should get
involve with upstream.

So: +1 to remove eglibc, and get rid of glibc 2.21, to keep only 2.22
and 2.23.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 14:48:48 +0100
Subject: [Buildroot] [PATCH 0/6] linux: build host perf (branch
 yem/linux-host-perf)
In-Reply-To: <cover.1457720152.git.yann.morin.1998@free.fr>
References: <cover.1457720152.git.yann.morin.1998@free.fr>
Message-ID: <20160319144848.1b7a006b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Mar 2016 19:19:56 +0100, Yann E. MORIN wrote:

>       linux/perf: really do not build the documentation
>       linux/perf: honour the number of parallel jobs
>       linux/perf: forcefully disable the features with missing dependencies
>       linux/perf: conditionally enable support for gz/xz compression

I've applied those four first patches.

>       linux/perf: build in a sub-directory

This one looks OK to me, but it doesn't make much sense applying it
without applying the last patch, on which I have comments.

>       linux/perf: build the host perf tool

I'll reply on this one.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

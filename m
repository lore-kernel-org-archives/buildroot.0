From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Oct 2017 20:39:50 +0100
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2017.09
 release
In-Reply-To: <20171030162456.9107-1-didin@synopsys.com>
References: <20171030162456.9107-1-didin@synopsys.com>
Message-ID: <20171030203950.5ebf8ea6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Oct 2017 19:24:56 +0300, Evgeniy Didin wrote:
> This commit finally bumps ARC tools to the most recent arc-2017.09 release version.
> 
> ARC GNU tools of version arc-2017.09 bring some quite significant changes like:
>  * Binutils v2.29 with additonal ARC patches

Typo: additional

>  * GCC 7.1.1 with additional ARC patches 
>  * glibc 2.24 with additional ARC patches

I'm confused: your patch is not changing anything regarding glibc.
Also, I thought that Synopsys was using glibc master, i.e 2.26, not
2.24.

Did I miss something ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

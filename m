From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Feb 2016 21:21:25 +0100
Subject: [Buildroot] [PATCH] toolchain: bump ARC toolchain components to
 arc-2015.12
In-Reply-To: <1454527762-483-1-git-send-email-ltrimas@synopsys.com>
References: <1454527762-483-1-git-send-email-ltrimas@synopsys.com>
Message-ID: <20160203212125.329014b9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lada Trimasova,

On Wed,  3 Feb 2016 22:29:22 +0300, Lada Trimasova wrote:
> This change introduces newer ARC toolchain in Buildroot.
> 
> That new arc-2015.12 release doesn't bring any significant changes
> but mostly is focused on fixes and minor improvements here and there.
> Most noticeable changes are:
>  * GCC: Source update to v4.8.5
>  * GDB: Updated to upstream 7.10 release.
> 
> You may find more info on fixes and improvements in that release at:
> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2015.12

This commit log seems to imply that you're bumping all toolchain
components (gcc, binutils, gdb), but in fact the commit is only bumping
gcc. Is this expected ?

If so, then the commit title should rather be:

gcc: bump ARC version to arc-2015.12

But I'm pretty sure you also want to bump binutils and gdb. Note that
this could be done in three separate commits.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

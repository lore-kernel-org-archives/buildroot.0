From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Nov 2016 22:33:11 +0100
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2016.09-rc1
In-Reply-To: <1479146197-41383-1-git-send-email-vzakhar@synopsys.com>
References: <1479146197-41383-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20161114223311.447ff80c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Nov 2016 20:56:37 +0300, Vlad Zakharov wrote:
> As described at:
> 4520524ba055706236db9f00dd79f1b2e2e87fde
> this commit continues a series of updates of ARC tools.
> This time we're updating tools to arc-2016.09-rc1.
> 
> This update contains a lot of important fixes, e.g. it fixes:
> http://autobuild.buildroot.net/results/4c7/4c77f33c842b37bf28cb931edf1b290e1bf4d93c//
> http://autobuild.buildroot.net/results/902/902729a0b98675ad803939e3ecdcf230065a6012//
> and other failures.
> 
> Other important change is that we also update gdb. Now we are
> using gdb 7.12.
> 
> This version of gdb requires C++ toolchain support so we add
> corresponding dependency to gdb Config.in file.
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>

I have rebuilt and updated the pre-built ARC toolchain used by the
autobuilders to use this new set of tools.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

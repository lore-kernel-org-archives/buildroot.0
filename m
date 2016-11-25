From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 21:30:31 +0100
Subject: [Buildroot] [PATCH v2 3/3] pru-sample: add sample PRU
	application
In-Reply-To: <1480096200-20475-3-git-send-email-ash.charles@savoirfairelinux.com>
References: <1480096200-20475-1-git-send-email-ash.charles@savoirfairelinux.com>
 <1480096200-20475-3-git-send-email-ash.charles@savoirfairelinux.com>
Message-ID: <20161125213031.2479c29f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 25 Nov 2016 12:50:00 -0500, Ash Charles wrote:
> As suggested [1], provide a sample application demonstrating how to use
> the PRU toolchain (specifically, the ti-cgt-pru and
> pru-software-support packages) within buildroot.  This sample is taken
> from PRU Lab #4 for the AM335x [2, 3].
> 
> Note: No special userspace tools are needed to load PRU firmware. The
> Linux kernel loads the specifically-named files as normal kernel
> firmware.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2016-November/178050.html
> [2] http://processors.wiki.ti.com/index.php/PRU_Training:_Hands-on_Labs
> [3] https://git.ti.com/pru-software-support-package/pru-software-support-package/trees/v4.0.2/labs/lab_4
> 
> Signed-off-by: Ash Charles <ash.charles@savoirfairelinux.com>

We don't really want the full source code of an application in
Buildroot. Would it be possible to download it instead?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

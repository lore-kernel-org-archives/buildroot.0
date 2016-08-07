From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Aug 2016 22:54:19 +0200
Subject: [Buildroot] [PATCH 0/3] Fix our defconfigs (branch
 yem/fix-defconfigs)
In-Reply-To: <cover.1470602446.git.yann.morin.1998@free.fr>
References: <cover.1470602446.git.yann.morin.1998@free.fr>
Message-ID: <20160807225419.443e606c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Aug 2016 22:44:33 +0200, Yann E. MORIN wrote:

>       defconfigs/kb9202: fix headers version
>       defconfigs/snps_axs_10*: uboot needs dtc
>       pcakage/uclibc: fix build on thumb2-only arm cpus

All three applied. If not already done, please make sure to report on
the uclibc mailing list the thumb2 problem.

BTW, now that I re-read your commit log, it's wrong: the SAMA5 are not
at all Thumb2 only CPUs. They are regular Cortex-A5 CPUs, i.e they
support both Thumb-2 and ARM.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

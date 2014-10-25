From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 12:46:22 +0200
Subject: [Buildroot] [PATCH v2 00/30] Removal of BR2_GCC_TARGET_TUNE and
 other arch/ updates
In-Reply-To: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141025124622.0184b24f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Oct 2014 22:26:47 +0200, Thomas Petazzoni wrote:

> Thomas Petazzoni (30):
>   arch/arm: add blind options to know the ARM architecture
>   ffmpeg: use the new BR2_ARM_CPU_ARM* options
>   ffmpeg: fix ARM condition for --{enable,disable}-vfp
>   gst-ffmpeg: use the new BR2_ARM_CPU_ARM* options
>   gst-ffmpeg: allow usage of ARMv6 optimizations on ARMv7 platforms

I've applied those first five patches, since they have been Reviewed-by
Yann. I'll leave the other patches pending for now, until someone
reviews them.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

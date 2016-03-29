From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 00:28:05 +0200
Subject: [Buildroot] [PATCH v2 00/17] ARM Cortex-M support and STM32
 defconfigs
In-Reply-To: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160330002805.25f2f797@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Mar 2016 22:08:02 +0100, Thomas Petazzoni wrote:

>   uclibc: add patches to simplify Thumb handling
>   uclibc: remove USE_BX handling
>   uclibc: gcc >= 4.9 can build a thumb/thread uclibc
>   uclibc: disable DOPIC on ARM FLAT

I've applied those four patches.

>   uclibc: NPTL thread implementation only available on MMU platforms

And also this one.

The other ones haven't received Acked-by/Reviewed-by, and some of them
have comments that I will address.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

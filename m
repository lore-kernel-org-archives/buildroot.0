From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 22:22:23 +0100
Subject: [Buildroot] [PATCH] configs/qemu: bump to the latest linux
 versions
In-Reply-To: <1454879953-19093-1-git-send-email-gustavo@zacarias.com.ar>
References: <1454879953-19093-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160207222223.11b237a1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun,  7 Feb 2016 18:19:13 -0300, Gustavo Zacarias wrote:
> Keep arm_nuri on 3.10.x for the usual reasons.

Should we drop arm_nuri? Does it provide something interesting that
arm_versatile and arm_vexpress doesn't provide?

> Keep mips & mipsel (32 bits) on 4.3.x because 4.4.x fails to boot
> properly (kernel stuck after the CPU cache info).

Vicente, are you aware of this problem?

In any case, patch applied! Thanks for taking care of the Qemu
configurations, they are definitely very useful.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

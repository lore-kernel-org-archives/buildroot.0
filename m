From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Mar 2017 22:29:29 +0200
Subject: [Buildroot] [PATCH] Add out-of-source U-Boot device tree support
In-Reply-To: <1d453613-dc32-9ab1-229b-2deed767a12f@mind.be>
References: <1490595146-5638-1-git-send-email-james@balean.com.au>
 <07d14184-7b9c-dd29-569c-db46aa765118@mind.be>
 <1490681640-14995-1-git-send-email-james@balean.com.au>
 <54cae0a0-a7a5-9ef0-08c8-a14e871cf8bb@mind.be>
 <20170328215334.405952d9@free-electrons.com>
 <1d453613-dc32-9ab1-229b-2deed767a12f@mind.be>
Message-ID: <20170328222929.036d1152@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Mar 2017 22:19:02 +0200, Arnout Vandecappelle wrote:

>  Yeah, thinking a bit more about it: if you use the same DT in U-Boot as in the
> kernel, then you probably let U-Boot pass it to the kernel so you don't need it
> at kernel build time...

Not necessarily. The DT can be used by U-Boot itself to know which
peripherals are available, and how they should be configured. I am not
sure there is a U-Boot option to bundle the DT within U-Boot just for
the purpose of passing it to the kernel. But I might be wrong, I
haven't looked in details at how U-Boot uses the DT.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

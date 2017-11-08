From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Nov 2017 17:55:24 +0100
Subject: [Buildroot] [RFCv1 0/4] Per-package SDK and target directories
In-Reply-To: <5DBA847110A28B46BBA17BE675F0C9B2181A8D38@cnshjmbx01>
References: <5DBA847110A28B46BBA17BE675F0C9B2181A8D38@cnshjmbx01>
Message-ID: <20171108175524.29e9a458@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 7 Nov 2017 11:48:17 +0000, Chu, Zhuliang (NSB - CN/Shanghai)
wrote:

> Q3: ERROR: Could not generate syscalls.(uclibc_error.log)
> I have not solved this problem, I put the error message in the attachment

So I built a basic uClibc system, toolchain included with the following
defconfig:

BR2_arm=y
BR2_cortex_a8=y

And it built just fine.

Are you able to reproduce this problem? Does it happen every time, or
just once in a while?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

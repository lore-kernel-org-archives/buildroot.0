From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 09:17:59 +0200
Subject: [Buildroot] [PATCH 7/9] toolchain: remove eglibc support
In-Reply-To: <87poslch4k.fsf@dell.be.48ers.dk>
References: <1463436782-17051-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1463436782-17051-8-git-send-email-thomas.petazzoni@free-electrons.com>
 <87poslch4k.fsf@dell.be.48ers.dk>
Message-ID: <20160517091759.49ce0db9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 May 2016 08:50:51 +0200, Peter Korsgaard wrote:

> Committed to next, thanks. Perhaps we should add:
> 
> select BR2_TOOLCHAIN_BUILDROOT_GLIBC
> 
> As the defconfig otherwise falls back to uClibc.

Good idea. I just sent a patch doing this.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

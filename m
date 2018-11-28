From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Nov 2018 11:45:44 +0100
Subject: [Buildroot] [PATCH 0/3] Add nds32 toolchain and ae3xx board
 support
In-Reply-To: <20181128101542.9561-1-nylon7@andestech.com>
References: <20181128101542.9561-1-nylon7@andestech.com>
Message-ID: <20181128114544.7506d7e2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Nov 2018 18:15:39 +0800, Nylon Chen wrote:
> This patchset adds basic support for Andes's nds32 ISA 
> and nds32 family's CPU IP based on ae3xx platform.
> The board is entirely supported since Linux 4.17.
> 
> Nylon Chen (3):
>   toolchain-external-andes-nds32: new package
>   arch: add support for Andes 32-bit (nds32) architecture
>   configs/andes_nds32_ae3xx: new defconfig

Thanks a lot for this contribution!

What is the status of the support of this architecture in gcc,
binutils, glibc and gdb ?

Also, when we add a new architecture in Buildroot, we do a lot of build
testing for it using our autobuilder infrastructure (see
http://autobuild.buildroot.org). Are you willing to help fixing the
build failures that may pop up when we will start building tons of
packages for the NDS32 architecture ?

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

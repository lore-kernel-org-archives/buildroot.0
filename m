From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Date: Wed, 24 Mar 2021 14:47:28 +0100
Subject: [Buildroot] gmp.h error compiling Linux 5.11 with Buildroot
 2021.02 default arm toolchain
In-Reply-To: <20210324105006.18e0dfb6@windsurf.home>
References: <a66afe8f-7f99-db2c-f966-c62dad9af5e3@bootlin.com>
 <20210324105006.18e0dfb6@windsurf.home>
Message-ID: <5c4c65f0-886a-e54c-16ae-ef6dc5093566@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for your questions!

On 3/24/21 10:50 AM, Thomas Petazzoni wrote:
> Do you have a Buildroot configuration that uses an internal toolchain +
> a Linux kernel built by Buildroot, that reproduces this? Or does it
> only happens with an external toolchain and/or when you build the
> kernel outside of Buildroot?


Actually, the compile job succeeds with the "omap2plus" configuration
when the 5.11 kernel is built by Buildroot. Good guess.

What doesn't work is building the kernel outside Buildroot with (the
Buildroot toolchain from output/host/ or the latest ARM 32 GNU toolchain).

Does this help?

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

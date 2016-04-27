From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 13:57:37 +0200
Subject: [Buildroot] [PATCH 1/2] uboot and arm trusted firmware build
 added to juno board
In-Reply-To: <5720A627.6000109@synopsys.com>
References: <eeb5c500573a8584bfbfe6d33bf160c725683a18.1461688139.git.jpinto@synopsys.com>
 <20160426221915.2651d4b2@free-electrons.com>
 <20160427102302.GM28464@e106497-lin.cambridge.arm.com>
 <20160427133149.330a7ea0@free-electrons.com>
 <5720A627.6000109@synopsys.com>
Message-ID: <20160427135737.6ff80c20@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Apr 2016 12:44:39 +0100, Joao Pinto wrote:

> The SCP firmware is a critical piece for the Juno, but the problem is that it
> can't be built from any repository I think.
> @Liviu: Could you please confirm this info?
> 
> If the SCP firmware exists as a binary only, then we have to include it in
> /board/arm/juno folder for building the ATF out-of-the-box.

It's really super annoying to include binary blob in the Buildroot
repository. If it really needs to be a binary blob, then I'd prefer to
have it available somewhere (ARM website, Github, etc.) and a Buildroot
package that downloads it.

Best regards,

Thoms
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

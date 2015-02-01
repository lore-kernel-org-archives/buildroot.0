From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 12:02:19 +0100
Subject: [Buildroot] [PATCH V3] memtest86+: new package
In-Reply-To: <54CD6C81.1040808@ou.edu>
References: <54CD6C81.1040808@ou.edu>
Message-ID: <20150201120219.6f32addf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Kenton,

On Sat, 31 Jan 2015 18:00:01 -0600, Steve Kenton wrote:
> Memtest86+ is a bootable standalone memory test program.
> 
> Please note that this is the forked memtest86+ program and not
> the original memtest86 which has different licensing. Buildroot
> does not support packages with a '+' sign in their name.
> 
> Memtest86+ is a utility designed to test whether your memory
> is in working order. It repeatedly writes an enormous amount
> of different patterns to all memory locations and reads them
> back again and verifies whether the result of the read is the
> same as what was written to memory.
> 
> Memtest86+ will only work on 32-bit or 64-bit x86 targets.
> It boots as an i486 program and autodetects hardware.
> 
> Signed-off-by Stephen M. Kenton <skenton@ou.edu>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>


> +	  Please note that this is the forked memtest86+ program and not
> +	  the original memtest86 which has different licensing. Buildroot
> +	  does not support packages with a '+' sign in their name.

This sentence could be improved:

	Buildroot does not support packages with a '+' sign in their
	name, which explains why it is named memtest86 and not
	memtest86+.

I guess Peter can make the change when applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 May 2013 11:53:58 +0200
Subject: [Buildroot] Buildroot + CoudeSourcery 2012.09
In-Reply-To: <82bbf577-2fa7-4161-aa47-e18b223fc7be@CO9EHSMHS011.ehs.local>
References: <82bbf577-2fa7-4161-aa47-e18b223fc7be@CO9EHSMHS011.ehs.local>
Message-ID: <20130502115358.7de0cc20@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear S?ren Brinkmann,

On Wed, 1 May 2013 15:03:16 -0700, S?ren Brinkmann wrote:

> I recently encountered some weird behavior, and couldn't really find
> anything about it.
> 
> When I compile a rootfilesystem with CS2012.09 it looks like globbing
> is broken, resulting in init scripts are not executed.
> 
> Using CS2012.03 and older works fine.

I guess you're talking about ARM ? We don't have support for CS
ARM 2012.09 in Buildroot because it's known to miscompile the Linux
kernel.

So it seems like this toolchain has problems. I think the kernel
problem has been reported to Mentor Graphics, but nothing happened.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

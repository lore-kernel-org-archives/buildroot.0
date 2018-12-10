From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Dec 2018 12:03:40 +0100
Subject: [Buildroot] [PATCH] gdb: Fix compilation for arc-2018.09 in
 some cases
In-Reply-To: <edb7c0f0a91fd30576c51df14f3b7f33a5c00460.camel@synopsys.com>
References: <20181210093526.29619-1-abrodkin@synopsys.com>
 <20181210114726.7df0a5fa@windsurf>
 <edb7c0f0a91fd30576c51df14f3b7f33a5c00460.camel@synopsys.com>
Message-ID: <20181210120340.112055e6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Dec 2018 10:52:20 +0000, Alexey Brodkin wrote:

> > Applied to master, thanks. I see this patch is in gdb 8.2, so surely
> > gdb 8.2 is not affected. What about previous gdb releases ?  
> 
> In OpenEmbedded they used to apply that patch for 8.1.x GDB unconditionally [1]
> which means we may want to have it in "package/gdb/8.0.1" and "package/gdb/8.1.1"
> but I didn't add it there since I had no way to reproduce this failure as
> compared to ARC.

Under what exact situations is this build failure happening ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

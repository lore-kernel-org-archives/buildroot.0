From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Jun 2018 23:52:23 +0200
Subject: [Buildroot] [PATCH v2 4/5] grpc: new package
In-Reply-To: <AC45FC8C-35CA-4B06-A9C1-06DD89A4131A@storagecraft.com>
References: <20180521175310.18563-1-charles.hardin@storagecraft.com>
 <20180521175310.18563-5-charles.hardin@storagecraft.com>
 <20180628233612.26e24014@windsurf>
 <AC45FC8C-35CA-4B06-A9C1-06DD89A4131A@storagecraft.com>
Message-ID: <20180628235223.78b5a4ee@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Jun 2018 21:45:32 +0000, Charles Hardin wrote:

> Ok - never tried ?arm? builds - only mips and x86, so this is likely going to be a bit
> more involved. But, I think this is a HOSTCXX problem - what is that version because
> I barely recall that I have to build the gRPC proto gen tools on the host to generate
> the stubs for the cross.

The problem is when building host tools with the host compiler, so the
target architecture shouldn't matter.

> So, it looks like it is a gcc 7 build on this host side?

Yes, I'm running a Fedora system with gcc 7.3.1.

I see on https://github.com/grpc/grpc/releases that they have newer
releases. Perhaps this issue has been fixed upstream.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

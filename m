From: MikeW <mw_phil@yahoo.co.uk>
Date: Mon, 16 Apr 2007 13:35:04 +0000 (UTC)
Subject: [Buildroot] Building external modules
References: <20070412190016.e4i0x2reg4vko48w@www.kvas.at>
	<001b01c77d8a$fd4c66b0$0402a8c0@atmel.com>
Message-ID: <loom.20070416T152925-123@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson <ulf@...> writes:

> 
> There are plenty of examples in the "packages" directory.
> 
> Take an arbitrary directory inside that directory,
> copy it and rename to copy to the name of your external module
> Update the config.in and <package>.mk files in the new
> directory, remove any patches and update "packages/Config.on"
> 
> /done
> 
> If you want to have linux kernel modules, you can patch the linux kernel
> after it is unpacked, and then the linux26.mk will insert the module
> in the correct place.
> 
> Best Regards
> Ulf Samuelsson
> 

Even so, it would be nice if there was something halfway between ...
a) the minimalist example in the buildroot doc page
b) reverse-engineering one of the existing packages, which may
have been done in an idiosyncratic manner

A canonical (fully commented) best-practice example.
Or perhaps "how I went about implementing a package.mk" indicating
the various decisions to be made.

Best regards,

MikeW

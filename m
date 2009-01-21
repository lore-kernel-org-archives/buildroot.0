From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 21 Jan 2009 20:29:39 +0100
Subject: [Buildroot] Why can't I make u-boot twice?
In-Reply-To: <20090121101956.27301887@danhplaptop>
References: <20090121101956.27301887@danhplaptop>
Message-ID: <1232566179.11888.48.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2009-01-21 klockan 10:19 -0800 skrev Dan Lyke:
> Help!
> 
> I have a successful build. I do:
> 
> make u-boot-clean
> make
> 

Don't you need to do:

?make u-boot-clean
make at91sam91261ekconfig
?make


?I have been thinking about the crummy support for building u-boot.
It might be a good idea to create a separate tarball for mkimage.


BR
Ulf Samuelsson




> and I get
> 
> cc     /home/danlyke/code/buildroot/project_build_arm/at91sam9261ek/u-boot-1.2.0-atmel/tools/mkimage.c
> -o /home/danlyke/code/buildroot/project_build_arm/at91sam9261ek/u-boot-1.2.0-atmel/tools/mkimage /home/danlyke/code/buildroot/project_build_arm/at91sam9261ek/u-boot-1.2.0-atmel/tools/mkimage.c:61:19:
> error: image.h: No such file or directory
> 
> followed by gobs of spew and, of course, an error and failure.
> 
> Any help?
> 
> Thanks.
> 
> Dan
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

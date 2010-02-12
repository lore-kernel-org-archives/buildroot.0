From: Andreas Kuehn <Andreas.Kuehn@gin.de>
Date: Fri, 12 Feb 2010 11:12:46 +0100
Subject: [Buildroot] buildroot-2009.11 doesn't build kernel modules
In-Reply-To: <4B73FE12.6000700@gin.de>
References: <4B73FE12.6000700@gin.de>
Message-ID: <4B75299E.8000808@gin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi! It's me again.


It seems I kicked myself, for some reasons.

The origin of the problem seems to be the kernel I used. I tried to
build with an 2.6.32.7 kernel and no modules were generated.
Now I used 2.6.32 sources and ... it created modules :-)

Hence, it was not a problem of buildroot, even if I don't know why I
achived various results.


Cheers
	akuehn




Andreas Kuehn wrote:
> Hi All!
> 
> 
> I trying to build an at91sam9263 based system. At earlier versions a
> full compilation run on buildroot creates all pieces including *.ko.
> The current buildroot does not.
> 
> I tried recompiling the kernel and of course make linux26 but no effect.
> Running make linux26-modules created the following output:
> 
> $ make linux26-modules
> cp -dpf
> /usr/cross/GL4200/buildroot-2009.11/output/build/u-boot-2009.06/tools/mkimage
> /usr/cross/GL4200/buildroot-2009.11/output/staging/usr/bin/
> 
> 
> Did I miss something?
> 
> Thanks in advance,
> 	akuehn
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

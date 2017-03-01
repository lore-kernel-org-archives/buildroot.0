From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 22:25:32 +0100
Subject: [Buildroot] [git commit] linux-headers: bump to 4.10 kernel
 version
In-Reply-To: <20170301220859.7de79d6a@gmx.net>
References: <20170301170422.EA26B80279@busybox.osuosl.org>
 <20170301220859.7de79d6a@gmx.net>
Message-ID: <20170301222532.3b34a5b1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Mar 2017 22:08:59 +0100, Peter Seiderer wrote:

> >  config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9
> >  	bool "4.9.x"
> >  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> > @@ -224,5 +232,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
> >  	default "4.1.38"	if BR2_KERNEL_HEADERS_4_1
> >  	default "4.4.48"	if BR2_KERNEL_HEADERS_4_4
> >  	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
> > -	default "4.9.9"		if BR2_KERNEL_HEADERS_4_9
> > +	default "4.10"		if BR2_KERNEL_HEADERS_4_10  
> 
> Is the removing of the 4.9.9. line intended? Would have expected only the
> added 4.10 line...

Doh, indeed, this seems like a mistake. Fabio, can you send a fixup
patch?

Thanks Peter for spotting this!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

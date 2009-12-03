From: tike64 at gmail.com <tike64@gmail.com>
Date: Thu, 03 Dec 2009 14:05:33 +0200
Subject: [Buildroot] make uImage
In-Reply-To: <20091203113649.297300@gmx.net>
References: <20091203113649.297300@gmx.net>
Message-ID: <4B17A98D.5040900@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jens Kleinhans wrote:
> root at benjamin-laptop:/usr/src/linux/arch/arm/boot# mkimage -A arm -O linux
> -C none -T kernel -a 20008000 -e 20008000 -n linux-2.6 -d
> arch/arm/boot/zImage uImage mkimage [OPTIONS]
> 
> Options: -f <MD5 name> ...

This seems not to be u-boot's mkimage. Check that the correct mkimage is found
in your path first. Also he path for the zImage seems not to be correct 
regarding your current working directory.

--

Timo

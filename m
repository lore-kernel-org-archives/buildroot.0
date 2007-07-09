From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 9 Jul 2007 20:27:52 +0200
Subject: [Buildroot] [buildroot 0001415]: SVN buildroot does not build
	configuration package
In-Reply-To: <6b74b6a0ff9392d0dc56e671767727a0@busybox.net>
References: <6b74b6a0ff9392d0dc56e671767727a0@busybox.net>
Message-ID: <20070709182752.GB24951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>---------------------------------------------------------------------- 
> chickenandporn - 07-09-07 11:19  
>---------------------------------------------------------------------- 
>(over checkout of r19054)
>patching file target/device/Soekris/net4521/linux.mk
>patching file target/device/Via/epia-mii/linux.mk
>patching file target/device/Sharp/LNode80/linux.mk

Yes, these should be deleted.

>patching file package/openssl/openssl.mk
>patching file Makefile
>patching file package/config/foo.h

There's no need to touch foo.h

>patching file toolchain/gcc/4.2.0/500-bsd-no-map_anonymous.patch
>patching file toolchain/dependencies/dependencies.sh
>patching file toolchain/dependencies/dependencies.mk
>patching file package/make/make.mk

Is there a newer version of make out there?

>patching file toolchain/dependencies/check-host-make.sh
>patching file toolchain/uClibc/uClibc-0.9.28-no-cp-d.patch

You should send this to the uClibc list..
>
>:~/src/buildroot Allan$ chmod +x
>toolchain/dependencies/check-host-make.sh

I don't think that you really need this to be executable

From: Ormund Williams <ormundw@panix.com>
Date: Sun, 10 Aug 2008 19:23:41 -0400
Subject: [Buildroot] Error building fontconfig-2.6.0
Message-ID: <1218410621.27761.98.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I was trying to make buildroot and ran into this error:

> configure: error: Cannot autodetect architecture in cross compile
> environment
>            Use --with-arch=ARCH to specify architecture
> make: *** 
> [/home/ormund/buildroot/build_i686/fontconfig-2.6.0/.stamp_configured]
> Error 1

I checked ~/buildroot/package/fontconfig/fontconfig.mk and found:
	--with-arch=$(GNU_TARGET_NAME)

Where do I look now?

__
Ormund

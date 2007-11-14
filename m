From: Janne Kario <janne.kario@gmail.com>
Date: Wed, 14 Nov 2007 23:54:25 +0200
Subject: [Buildroot] I think I'm in love! And other newbie-type
	questions...
In-Reply-To: <1195075365.17103.31.camel@mercury.sprymusic>
References: <1195065229.17103.13.camel@mercury.sprymusic>	<fhfl84$mtf$1@ger.gmane.org>
	<1195075365.17103.31.camel@mercury.sprymusic>
Message-ID: <fhfqqj$ar3$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jean-Claude Gervais wrote:
> Hi Janne,
> 
> By reading the mailing list archives, I think I understand the problem;
> When configuring Buildroot, you must specify the path to your
> kernel .config file.

You were 10 minutes ahead of me in reading the mailing lists. :)

I managed to buildroot compile using 'make defconfig'. Apparently, it 
uses some default kernel configuration (currently running kernel?). 
Furthermore buildroot comes with a bunch of default configurations for 
different boards so typing something like 'make atngw100_defconfig' 
would create default buildroot suitable for Atmel NGW100.

I haven't read any of the buildroot documentation (perhaps I should) but 
I think whenever you manage to build a working kernel configuration for 
your device you take the .config file and save it so that you can build 
new updated rootfs with more recent kernel version using the exact same 
configuration.

I'm not trying to accomplish anything yet. Just playing with this 
awesome stuff.

j

From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Fri, 6 Nov 2009 13:02:57 -0500
Subject: [Buildroot] How to figure out what a package is?
In-Reply-To: <hd1mof$7qt$1@ger.gmane.org>
References: <hd1mof$7qt$1@ger.gmane.org>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901E84907@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday, November 06, 2009 10:35 AM, Grant Edwards wrote:
> This sounds a bit stupid, but where do you find a description
> of what a given package is?
> 
> I've got a list of packages supported by buildroot.
> 
> How do I know what, for example, the package named "lite" is?
> 
> Googling for the name has proven pointless...

Look at the help for the package...

"lite" says it's a "LiTE (toolbox engine)"

config BR2_PACKAGE_LITE
	bool "LiTE (toolbox engine)"
	depends on BR2_PACKAGE_DIRECTFB
	help
	   LiTE stands for LiTE is a Toolbox Engine. 
	   Its role is to facilitate the functions of DirectFB so that a
	   toolbox could be written on top of DirectFB with less effort.
	   As such LiTE has abstractions for the underlying graphics and
	   event systems.

	   See http://www.directfb.org/wiki/index.php/LiTE:Architecture

Regards,
Hartley

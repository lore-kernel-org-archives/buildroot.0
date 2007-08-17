From: Crane, Matthew <mcrane03@harris.com>
Date: Fri, 17 Aug 2007 15:05:56 -0400
Subject: [Buildroot] Overriding DL_DIR in the environment
In-Reply-To: <0708171957370.14301@somehost>
References: <1187370334.31026.4.camel@elrond.sweden.atmel.com>
	<0708171957370.14301@somehost>
Message-ID: <E496871456016F4CA8959BE4105D2A890E8C30@troe2k1.cs.myharris.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I use a link as well, but should the option be added to the menus so
that it does not need to be specified in the environment?

Matt

-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org]
On Behalf Of Cristian Ionescu-Idbohrn
Sent: Friday, August 17, 2007 1:59 PM
To: buildroot at uclibc.org
Subject: Re: [Buildroot] Overriding DL_DIR in the environment

On Fri, 17 Aug 2007, Ulf Samuelsson wrote:

> I keep a central download location for all tarballs,
> and find it a pain to always have to edit the DL_DIR
> variable during "make menuconfig".
>
> It would be nice to be able to override the ".config"
> value of DL_DIR in the shell environment.
>
> Here is a simple patch which will,
> if you define
>
> $ export BUILDROOT_DL_DIR /usr/local/install/downloads
>
> in your ".bashrc", override the DL_DIR in the ".config".

Wouldn't a symlink (that's what I use) sort that out?


Cheers,

-- 
Cristian
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot

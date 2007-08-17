From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Fri, 17 Aug 2007 19:59:08 +0200 (CEST)
Subject: [Buildroot] Overriding DL_DIR in the environment
In-Reply-To: <1187370334.31026.4.camel@elrond.sweden.atmel.com>
References: <1187370334.31026.4.camel@elrond.sweden.atmel.com>
Message-ID: <0708171957370.14301@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

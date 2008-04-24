From: John Voltz <john.voltz@gmail.com>
Date: Thu, 24 Apr 2008 09:53:43 -0400
Subject: [Buildroot] svn commit: trunk/buildroot/package/alsamixergui
In-Reply-To: <20080424133421.GA11391@mx.loc>
References: <20080424131426.5FAF93C824@busybox.net>
	<20080424133421.GA11391@mx.loc>
Message-ID: <46a136670804240653t51798ddfw8eab35bb0db22d53@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's not sane. I will revert it. I honestly don't know why that got put in
there. I'm going to stop now before I do any more damage :-(

John


On Thu, Apr 24, 2008 at 9:34 AM, Bernhard Fischer <rep.dot.nop@gmail.com>
wrote:

> On Thu, Apr 24, 2008 at 06:14:26AM -0700, ninevoltz at uclibc.org wrote:
> >Author: ninevoltz
> >Date: 2008-04-24 06:14:25 -0700 (Thu, 24 Apr 2008)
> >New Revision: 21831
>
> >Modified: trunk/buildroot/package/alsamixergui/alsamixergui.mk
> >===================================================================
> >--- trunk/buildroot/package/alsamixergui/alsamixergui.mk       2008-04-24
> 11:22:06 UTC (rev 21830)
> >+++ trunk/buildroot/package/alsamixergui/alsamixergui.mk       2008-04-24
> 13:14:25 UTC (rev 21831)
> >@@ -10,7 +10,7 @@
> > ALSAMIXERGUI_INSTALL_STAGING = NO
> > ALSAMIXERGUI_INSTALL_TARGET = YES
> >
> >-ALSAMIXERGUI_CONF_OPT = LDFLAGS="-L$(STAGING_DIR)/usr/lib
> -L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/avr32-linux-uclibc/lib -lstdc++"
> >+ALSAMIXERGUI_CONF_OPT = LDFLAGS="-L$(STAGING_DIR)/usr/lib
> -L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/avr32-linux-uclibc/lib -lstdc++
> -lX11"
> >
>
> and why is having "avr32" in there sane?
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080424/c61498e6/attachment.htm 

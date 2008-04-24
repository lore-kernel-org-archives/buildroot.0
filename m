From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 24 Apr 2008 15:34:21 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/alsamixergui
In-Reply-To: <20080424131426.5FAF93C824@busybox.net>
References: <20080424131426.5FAF93C824@busybox.net>
Message-ID: <20080424133421.GA11391@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 24, 2008 at 06:14:26AM -0700, ninevoltz at uclibc.org wrote:
>Author: ninevoltz
>Date: 2008-04-24 06:14:25 -0700 (Thu, 24 Apr 2008)
>New Revision: 21831

>Modified: trunk/buildroot/package/alsamixergui/alsamixergui.mk
>===================================================================
>--- trunk/buildroot/package/alsamixergui/alsamixergui.mk	2008-04-24 11:22:06 UTC (rev 21830)
>+++ trunk/buildroot/package/alsamixergui/alsamixergui.mk	2008-04-24 13:14:25 UTC (rev 21831)
>@@ -10,7 +10,7 @@
> ALSAMIXERGUI_INSTALL_STAGING = NO
> ALSAMIXERGUI_INSTALL_TARGET = YES
> 
>-ALSAMIXERGUI_CONF_OPT = LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/avr32-linux-uclibc/lib -lstdc++"
>+ALSAMIXERGUI_CONF_OPT = LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/avr32-linux-uclibc/lib -lstdc++ -lX11"
> 

and why is having "avr32" in there sane?

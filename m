From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 15:14:25 +0200
Subject: [Buildroot] [PATCH v15 0/9] xbmc: Add support for uClibc, OpenGL,
 libva & optional packages
In-Reply-To: <XnsA375DC3AC2333berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1406090425-5925-1-git-send-email-bernd.kuhls@t-online.de>
 <20140723221057.2f437a0b@free-electrons.com>
 <XnsA375DC3AC2333berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20140727151425.740c1c71@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

Could you try to Cc me on your answers to my e-mails? This way, your
e-mails will be in my Inbox (in addition to my Buildroot folder), which
means I'll see your e-mail much sooner and it won't be lost in the 1874
unread e-mails I have in my Buildroot folder at the moment.

On Fri, 25 Jul 2014 21:38:58 +0200, Bernd Kuhls wrote:
> Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
> @public.gmane.org> wrote in news:20140723221057.2f437a0b at free-electrons.com:
> 
> >>   xbmc: Add missing egl-related cflags
> > 
> > For this one, I'm not sure. Shouldn't XBMC itself be capable of calling
> > pkg-config on egl to get the appropriate flags? On the other hand, it's
> > true that xbmc.mk already has specific hacks for the RPi.
> 
> Hi,
> 
> yes, xbmc should use pkg-config, but it does not for egl at rpi:
> https://github.com/xbmc/xbmc/blob/Gotham/configure.in#L1047

Right. But isn't the proper fix then to add a patch for XBMC to make it
use pkg-config in this case, and submit that patch upstream?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

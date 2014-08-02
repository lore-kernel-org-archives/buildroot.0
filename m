From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 02 Aug 2014 13:19:16 +0200
Subject: [Buildroot] [PATCH v16 1/3] xbmc: Add X.org/OpenGL support
References: <1406914359-31106-1-git-send-email-bernd.kuhls@t-online.de>
 <1406914359-31106-2-git-send-email-bernd.kuhls@t-online.de>
 <20140801213036.GE3778@free.fr>
 <XnsA37D62E96EAberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20140801221848.GH3778@free.fr>
Message-ID: <XnsA37D87825DB30berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
news:20140801221848.GH3778 at free.fr: 

> Well, I said "XBMC builds just fine" and "we remove [rsxs] from the
> rootfs". 

Hi,

ah, I see what you mean:

define XBMC_CLEAN_UNUSED_ADDONS
	rm -Rf $(TARGET_DIR)/usr/share/xbmc/addons/screensaver.rsxs.plasma

Since I am using rsxs screensaver I did not notice the line above when
answering your question. 

There are three different rsxs screensavers however:
https://github.com/xbmc/xbmc/tree/Gotham/addons/screensaver.rsxs.euphoria
https://github.com/xbmc/xbmc/tree/Gotham/addons/screensaver.rsxs.plasma
https://github.com/xbmc/xbmc/tree/Gotham/addons/screensaver.rsxs.solarwinds

I am using the remaining two and they work fine.

Regards, Bernd

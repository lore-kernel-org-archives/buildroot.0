From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Jun 2015 13:22:25 +0200
Subject: [Buildroot] [PATCH] package/vlc: install vlc libraries in
	staging
References: <1435489228-7010-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <XnsA4C7880E46222berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain Naour <romain.naour@openwide.fr> wrote in 
news:1435489228-7010-1-git-send-email-romain.naour at openwide.fr:

> Although no package seems to link against vlc libraries right now, these
> libraries will be necessary for upcoming new efl emotion-generic-players
> package.
> 
> Signed-off-by: Romain Naour <romain.naour-oid7hba3+
9NWj0EZb7rXcA@public.gmane.org>

Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Part of my upcoming freeswitch package will be mod_vlc which links against 
libvlc.so, so I also have this patch in my local queue.

Regards, Bernd

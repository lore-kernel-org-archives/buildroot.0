From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 23 Nov 2014 14:26:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/nfs-utils: Fix static build
References: <1416748839-5316-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <XnsA3EE92FA316C4berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls <bernd.kuhls@t-online.de> wrote in 
news:1416748839-5316-1-git-send-email-bernd.kuhls at t-online.de:

> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +NFS_UTILS_CONF_ENV += LIBS="-lpthread"
> +endif

Hi,

lol, Yann and I had the same thought, but his patch is better, therefore I 
marked mine as superseded in patchworks ;)

Regards, Bernd

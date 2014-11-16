From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 16 Nov 2014 18:21:04 +0100
Subject: [Buildroot] [PATCH] package/clamav: fix build with uClibc
References: <1416155667-21771-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <XnsA3E7BAAD88DC2berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:1416155667-21771-1-git-send-email-yann.morin.1998 at free.fr:

> So, just extend the test so that backtrace support is disable on uClibc,
> unless it has been configured with backtrace support.

Hi,

thanks, your patch supersedes http://patchwork.ozlabs.org/patch/406336/

Please add the upstream bugtracker URL to your patch: 
https://bugzilla.clamav.net/show_bug.cgi?id=11170

Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Regards, Bernd

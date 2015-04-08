From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 08 Apr 2015 23:45:55 +0200
Subject: [Buildroot] [PATCH 1/3] package/tvheadend: Fix inclusion of
	dtv-scan-tables files
References: <1426936276-23649-1-git-send-email-bernd.kuhls@t-online.de>
 <20150403222157.GB4428@free.fr>
Message-ID: <XnsA476F1BFE45A0berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:20150403222157.GB4428 at free.fr:

> So, I still think a better solution would be to just patch-out the
> download from the configure script.

Hi,

done by analyzing the behaviour of the getmuxlist script and copying the dvb 
data earlier: http://patchwork.ozlabs.org/patch/459513/

Regards, Bernd

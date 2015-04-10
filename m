From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 10 Apr 2015 12:52:29 +0200
Subject: [Buildroot] [RFC] Move host-pkgconf dependency to
	package/pkg-autotools.mk
References: <XnsA4787599FCF1BberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <XnsA47882F7852FCberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

and we have ~30 generic packages also depending on host-pkgconf. What about 
adding the host-pkgconf dependency to package/pkg-generic.mk instead?

Regards, Bernd

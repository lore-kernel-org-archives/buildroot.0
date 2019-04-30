From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 30 Apr 2019 23:40:15 +0200
Subject: [Buildroot] [RFC v2 6/7] package/mesa3d: switch build system to
 meson
References: <20190417214348.15685-1-romain.naour@smile.fr>
 <20190417214348.15685-6-romain.naour@smile.fr>
 <20190425225621.448aaaeb@gmx.net>
 <d5436033-635f-2d37-5ee6-1070895f6406@smile.fr>
 <20190430231428.231ee566@gmx.net>
Message-ID: <XnsAA41F0CB447C6berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Peter Seiderer <ps.report@gmx.net> wrote in
news:20190430231428.231ee566 at gmx.net: 

> So use the glx option only in case platform x11 is selected?

Hi Peter,

even autoconf-based mesa3d enables glx only when x11 is used:

https://git.buildroot.net/buildroot/tree/package/mesa3d/mesa3d.mk#n85

Regards, Bernd

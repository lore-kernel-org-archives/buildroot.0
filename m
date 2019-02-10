From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Feb 2019 19:58:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 18.3.0
References: <20181209204607.13857-1-bernd.kuhls@t-online.de>
 <20181210115022.714db101@windsurf>
Message-ID: <4r86jfxr7e.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 10 Dec 2018 11:50:22 +0100 schrieb Thomas Petazzoni:

> Applied to master, thanks. However, with the recent update of
> pkg-config, there is a possibility that the patch 0002 is no longer
> needed. Could you have a look at that ?

Hi Thomas,

mesa3d-19.x will deprecate the use of autotools

https://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?
h=19.0&id=e68777c87ceed02ab199b32f941778c3cf97c794

but still allow its usage. Currently I am porting the mesa3d package to 
meson so I will not put any effort in investigating patch 0002.

Regards, Bernd

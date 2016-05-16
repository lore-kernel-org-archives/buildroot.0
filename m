From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 16 May 2016 19:18:16 +0200
Subject: [Buildroot] kodi 16 on aarch64
References: <trinity-8cc2631d-885d-437a-aec1-a88667084c0c-1463257448483@3capp-mailcom-bs05>
Message-ID: <XnsA60AC45F57D8AberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

daggs <daggs@gmx.com> wrote in news:trinity-8cc2631d-
885d-437a-aec1-a88667084c0c-1463257448483 at 3capp-mailcom-bs05:

> I'm trying to compile a buildroot aarch64 env with kodi on it.

Hi,

Kodi 16.x-Jarvis has no support for aarch64, the next version 17.x-Krypton 
will have it after my pull request was accepted:
https://github.com/xbmc/xbmc/commit/62c160c23ed4c074d106f30a43638fac66568ac6

You can also try my buildroot fork with Kodi 17 patches:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/148325

Regards, Bernd

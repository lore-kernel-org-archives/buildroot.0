From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed,  5 Jul 2017 22:46:52 +0300
Subject: [Buildroot] [PATCH 0/1] Select libgcrypt along with webkitgtk
Message-ID: <20170705194653.19890-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

While making a completely clean build starting from raspberrypi3_defconfig,
I've noticed that libgcrypt is not automatically chosen -- and it should be!
Probably in many cases when people build WebKitGTK+ they also choose other
packages that need libgcrypt and the issue went unnoticed.

(It seems maybe it was a good idea to get serious and give it a try to poke
at the webkitgtk package :-P)

Greetings,


Adrian Perez de Castro (1):
  webkitgtk: select libgcrypt

 package/webkitgtk/Config.in    | 1 +
 package/webkitgtk/webkitgtk.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.13.2

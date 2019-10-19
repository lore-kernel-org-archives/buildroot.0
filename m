From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Oct 2019 22:32:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXfont2: fix
 libbsd detection
References: <20191019074826.16026-1-bernd.kuhls@t-online.de>
 <ef53b723-6522-1803-e5a3-163a581abb91@mind.be>
Message-ID: <XnsAAEDE4F5CCC08berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle <arnout@mind.be> wrote in 
news:ef53b723-6522-1803-e5a3-163a581abb91 at mind.be:

>  Why didn't you have a Fixes: tag?

Hi Arnout,

due to the meson-lzma problem the autobuilders did not catch the error.

Regards, Bernd

From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 13 Aug 2007 17:52:23 +0200
Subject: [Buildroot] fontconfig fails using latest snapshot
References: <008101c7ddaf$503dc830$2600a8c0@engineering5>
Message-ID: <021c01c7ddcc$a7a9f9f0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> linuxbox:/home/christopher/sb/buildroot# make fontconfig
> . <snip> .
> /usr/include/ft2build.h:56:38: error: freetype/config/ftheader.h: No such file or directory


You need to build freetype2 before fontconfig.


Best Regards
Ulf Samuelsson

From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 16 Nov 2014 06:33:19 +0100
Subject: [Buildroot] [PATCH 1/1] pkg-cmake.mk: Set
	CMAKE_SYSTEM_PROCESSOR.
References: <1416067219-30211-1-git-send-email-volker.krause@kdab.com>
Message-ID: <XnsA3E742AEF9F1BberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Volker Krause <volker.krause@kdab.com> wrote in 
news:1416067219-30211-1-git-send-email-volker.krause at kdab.com:

> This is rarely needed by packages, but convenient to have when it is.

Hi,

the x265 package (patch in patchworks: 
http://patchwork.ozlabs.org/patch/408501/) also needs CMAKE_SYSTEM_PROCESSOR.

Regards, Bernd

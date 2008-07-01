From: Micha Nelissen <micha@neli.hopto.org>
Date: Tue, 01 Jul 2008 23:08:41 +0200
Subject: [Buildroot] libtiff.la contains hardcoded link to /lib/libjpeg.la
Message-ID: <g4e6gf$hkv$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I found that libtiff.la contains hardcoded link to /lib/libjpeg.a. I
couldn't find why, though. It prevents proper building of libtiff using
applications.

Anyone know why?

Micha

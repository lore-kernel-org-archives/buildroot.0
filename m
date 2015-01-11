From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jan 2015 22:05:14 +0100
Subject: [Buildroot] Repository information during build
References: <CAAOPk_zdYo4RhifBpQq8mtBQmt4_xfmhm0rQw+ubZ9DOUDy1SQ@mail.gmail.com>
Message-ID: <XnsA41FE0AE5C843berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Ruschival <t.ruschival@gmail.com> wrote 
in news:CAAOPk_zdYo4RhifBpQq8mtBQmt4_xfmhm0rQw+ubZ9DOUDy1SQ at mail.gmail.com:

> I.e. how do I find out the revision of the "master" branch Buildroot used
> to create the tarball?

Hi,

an example: 
http://git.buildroot.net/buildroot/tree/package/tvheadend/tvheadend.mk

You are looking for $(TVHEADEND_VERSION).

Regards, Bernd

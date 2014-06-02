From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 02 Jun 2014 20:11:12 +0200
Subject: [Buildroot] [PATCH 0/30 v11] xbmc: bump version to 13.1 (branch
	yem/bernd/xbmc-10)
References: <cover.1401274944.git.yann.morin.1998@free.fr>
Message-ID: <0bru5bx1ii.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
news:cover.1401274944.git.yann.morin.1998 at free.fr: 

> This is version 11 of the XBMC bump to Gotham, initiated by Bernd.
> This version reorders the series so that we can quickly bump XBMC, to
> keep an iso-functional setup (mostly: on the Raspberry Pi), then new
> required packages and dependencies, to finally enable building XBMC
> on a full-openGL capable system.

would you mind when I send v12, if necessary? I re-ordered my patches 
according to your v11 and updated mesa3d to rc5. This alone does not justify 
a v12 series, but no one knows when xbmc 13.1 is released ;)

> I'm a bit disapointed I did not find enough free time to test the x86 +
> full-openGL side of the series, but the bump in itself is already a good
> thing.

Rest assured, I am using this setup, based on uClibc, for more than nine 
months now, and it (livetv with tvheadend, various video formats and streams, 
Goom) works fine.

Regards, Bernd

---
Diese E-Mail ist frei von Viren und Malware, denn der avast! Antivirus Schutz ist aktiv.
http://www.avast.com

From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 17:40:03 +0100
Subject: [Buildroot] [PATCH 0/8] package/links: With or without you ;)
Message-ID: <1455986411-14273-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this patch series adds --with/--without to CONF_OPTS as requested by
Thomas: http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/140285

Regards, Bernd

Bernd Kuhls (8):
  package/links: add --with/--without-zlib
  package/links: add --with/--without-lzma
  package/links: add --with/--without-ssl
  package/links: add --with/--without-libevent
  package/links: add --with/--without-bzip2
  package/links: add --with/--without-libtiff
  package/links: add --disable-graphics
  package/links: add --with/--without-libjpeg

 package/links/links.mk | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

-- 
2.7.0

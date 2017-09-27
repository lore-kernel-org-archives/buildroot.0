From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 27 Sep 2017 19:16:02 +0200
Subject: [Buildroot] [PATCH] perl: bump to version 5.26.1
References: <20170927083250.12150-1-francois.perrad@gadz.org>
Message-ID: <iv2t9exl3e.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 27 Sep 2017 10:32:50 +0200 schrieb Francois Perrad:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl/perl.hash | 12 ++++++------
>  package/perl/perl.mk   |  8 ++++----
>  utils/scancpan         | 18 +++++++++---------
>  3 files changed, 19 insertions(+), 19 deletions(-)

Hi,

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[build-tested using this defconfig:
BR2_aarch64=y
BR2_PACKAGE_PERL=y
BR2_PACKAGE_PERL_DATETIME_TINY=y
BR2_PACKAGE_PERL_DIGEST_SHA1=y
BR2_PACKAGE_PERL_FILE_UTIL=y
BR2_PACKAGE_PERL_GDGRAPH=y
BR2_PACKAGE_PERL_IO_SOCKET_SSL=y
BR2_PACKAGE_PERL_JSON_TINY=y
BR2_PACKAGE_PERL_LIBWWW_PERL=y
BR2_PACKAGE_PERL_MAIL_DKIM=y
BR2_PACKAGE_PERL_MIME_BASE64=y
BR2_PACKAGE_PERL_MOJOLICIOUS=y
BR2_PACKAGE_PERL_NETADDR_IP=y
BR2_PACKAGE_PERL_PATH_TINY=y
BR2_PACKAGE_PERL_TIME_HIRES=y
BR2_PACKAGE_PERL_XML_LIBXML=y ]

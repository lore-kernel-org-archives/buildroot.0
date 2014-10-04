From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 04 Oct 2014 23:46:53 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/softether: New package
References: <1412459098-13939-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <XnsA3BCF1EA97B36berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls <bernd.kuhls@t-online.de> wrote in 
news:1412459098-13939-1-git-send-email-bernd.kuhls at t-online.de:

>  package/Config.in                                  |    1 +
>  package/softether/Config.in                        |   28 +
>  package/softether/softether-0001-debian.patch      | 2381 
++++++++++++++++++++
>  .../softether/softether-0002-cross-compile.patch   |   30 +
>  package/softether/softether-0003-iconv.patch       |   27 +
>  package/softether/softether.mk                     |   36 +

Hi,

please read this note before applying the patches:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/94715

Regards, Bernd

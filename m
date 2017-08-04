From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 04 Aug 2017 22:20:29 +0200
Subject: [Buildroot] [PATCH 03/10] convert dependencies to libssl
References: <20170804185521.12320-1-Adamduskett@outlook.com>
 <20170804185521.12320-4-Adamduskett@outlook.com>
Message-ID: <dh1f5ex2tj.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

Am Fri, 04 Aug 2017 14:55:14 -0400 schrieb Adam Duskett:

> Convert the remaining packages that select or depend on OpenSSL and
> OpenSSL-host to instead select or depend on libssl or libssl-host.

>  package/kodi/Config.in                                         |  2 +-
>  package/kodi/kodi.mk                                           |  2 +-

NAK for Kodi, LibreELEC switches back to OpenSSL: https://github.com/
LibreELEC/LibreELEC.tv/pull/1312#issuecomment-279255179

Regards, Bernd

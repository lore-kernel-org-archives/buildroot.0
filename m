From: Alexey Lukyanchuk <skif@skif-web.ru>
Date: Fri, 01 May 2020 22:39:44 +0300
Subject: [Buildroot] [PATCH 1/1] package/qpdf: fix 'no such file'
 exeption
In-Reply-To: <20200501193606.GC3687@scaer>
References: <20200501155139.4380-1-skif@skif-web.ru>
 <20200501193606.GC3687@scaer>
Message-ID: <104151588361976@mail.yandex.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All


--?
Regards,
Alexey Lukyanchuk
skif at skif-web.ru


01.05.2020, 22:36, "Yann E. MORIN" <yann.morin.1998@free.fr>:
> Alexey, All,
>
> On 2020-05-01 18:51 +0300, Alexey Lukyanchuk spake thusly:
>> ?Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
>
> Your previous iteration had a good commit log, so I took it for this
> commit, reworded it a bit, and applied to master, thanks.
>
> Regards,
> Yann E. MORIN.
>
>> ?---
>> ??package/qpdf/qpdf.mk | 2 +-
>> ??1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> ?diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
>> ?index ac703d716e..fd31140b0c 100644
>> ?--- a/package/qpdf/qpdf.mk
>> ?+++ b/package/qpdf/qpdf.mk
>> ?@@ -11,7 +11,7 @@ QPDF_LICENSE = Apache-2.0 or Artistic-2.0
>> ??QPDF_LICENSE_FILES = LICENSE.txt Artistic-2.0
>> ??QPDF_DEPENDENCIES = host-pkgconf zlib jpeg
>>
>> ?-QPDF_CONF_OPTS = --without-random
>> ?+QPDF_CONF_OPTS = --with-random=/dev/urandom
>>
>> ??ifeq ($(BR2_PACKAGE_GNUTLS),y)
>> ??QPDF_CONF_OPTS += --enable-crypto-gnutls
>> ?--
>> ?2.17.1
>>
>> ?_______________________________________________
>> ?buildroot mailing list
>> ?buildroot at busybox.net
>> ?http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> | Yann E. MORIN | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software Designer | \ / CAMPAIGN | ___ |
> | +33 561 099 427 `------------.-------: X AGAINST | \e/ There is no |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL | v conspiracy. |
> '------------------------------^-------^------------------^--------------------'

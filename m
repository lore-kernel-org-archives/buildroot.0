From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 15 Apr 2016 07:09:02 +0200
Subject: [Buildroot] [PATCH v13 24/26] package/freeswitch: enable mod_cv
References: <1460662320-1437-1-git-send-email-bernd.kuhls@t-online.de>
 <1460662320-1437-25-git-send-email-bernd.kuhls@t-online.de>
 <CAHXCMMLMkZwaLGbgP7wpR4KXWW_p=kPtna=AZA6FSCN=4kdnAg@mail.gmail.com>
Message-ID: <XnsA5EB48BCA3188berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

Samuel Martin <s.martin49@gmail.com> wrote in 
news:CAHXCMMLMkZwaLGbgP7wpR4KXWW_p=kPtna=AZA6FSCN=4kdnAg at mail.gmail.com:

>> +ifeq ($(BR2_PACKAGE_OPENCV),y)
>> +FREESWITCH_DEPENDENCIES += opencv
> Just wondering: is freeswitch only compatible with opencv2?

yes:
https://freeswitch.org/stash/projects/FS/repos/freeswitch/browse/src/mod/appl
ications/mod_cv/mod_cv.cpp?at=refs%2Fheads%2Fv1.6#34

I tried to compile with opencv3 and it failed due to missing opencv2 headers.

Regards, Bernd

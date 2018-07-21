From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Jul 2018 15:38:18 +0200
Subject: [Buildroot] [PATCH v3 11/22] package/x11r7/xlib_*: mass switch
 to xorgproto
References: <20180630110853.29339-1-bernd.kuhls@t-online.de>
 <20180630110853.29339-12-bernd.kuhls@t-online.de>
 <20180702215754.GQ2604@scaer>
Message-ID: <ajpb2fx9u.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Am Mon, 02 Jul 2018 23:57:54 +0200 schrieb Yann E. MORIN:

>>  HOST_XLIB_LIBXAU_DEPENDENCIES = \
>> -	host-pkgconf host-xutil_util-macros host-xproto_xproto
>> +	host-pkgconf host-xutil_util-macros xorgproto
> 
> Did you mean host-xorgproto instead?

Oops, yes, will be fixed in the next iteration, thanks!

>>  	select BR2_PACKAGE_XCB_PROTO
> 
> To be sure, xcb-proto is still a separate package, right?

It looks like both packages are still developed seperately.

Xcb-proto received its last release in February 2018 and its last commit 
in March ( https://cgit.freedesktop.org/xcb/proto ) while xorgproto was 
also released in February of this year: https://cgit.freedesktop.org/xorg/
proto/xorgproto/log/

Regards, Bernd

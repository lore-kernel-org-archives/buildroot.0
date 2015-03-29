From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Mar 2015 13:52:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXpm: Add
	gettext/iconv support
References: <1427628199-21758-1-git-send-email-bernd.kuhls@t-online.de>
 <20150329134114.7d71836b@free-electrons.com>
Message-ID: <XnsA46C8D150BAB6berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20150329134114.7d71836b at free-electrons.com:

> But it would be to check if gettext and libiconv support is actually
> mandatory, or only optional.

Hi Thomas,

according to the source code there is no mandatory check for libiconv.

Quoting line 32 from configure.ac

AC_SEARCH_LIBS([gettext], [intl], [USE_GETTEXT="yes"], [USE_GETTEXT="no"])

so gettext is optional.

Regards, Bernd

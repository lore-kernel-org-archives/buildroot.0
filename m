From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:19:17 +0200
Subject: [Buildroot] [PATCH/RFC 01/27] package/libsquish: New package
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
 <1427913380-14808-2-git-send-email-bernd.kuhls@t-online.de>
 <20150405213109.GJ4134@free.fr>
Message-ID: <XnsA4B9A60A38B78berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:20150405213109.GJ4134 at free.fr:

>> +       https://code.google.com/p/libsquish
> 
> Don;t we have a better homepage for libsquish? Google code is slated for
> retirement later this year (or early next year). It would be a pity to
> have a dangling URL especially as we already know about that.

the project moved to sourceforge and released version 1.13 while Kodi still 
contains a fork of 1.10. I updated my patch kodi beta2 series to use upstream 
1.10 with a kodi-specific patch. The next release of my patch series 
following kodi beta2 will contain libsquish 1.13 as it includes cmake support 
now.

>> +LIBSQUISH_SITE = http://sources.openelec.tv/devel
> 
> I'm a bit uneasy at pointing to Google code as the homepage, and at the
> same time using a third-party to get the archive from, especially since
> it looks like this version has been modified by OpenELEC.

Partly done, kodi beta2 gets the source from code.google.com.

>> +LIBSQUISH_INSTALL_STAGING = YES
>> +LIBSQUISH_LICENSE = MIT
>> +LIBSQUISH_LICENSE_FILES = README
> 
> You do not provide build commands. Is that on purpose, or did you
> forget? ;-)

I forgot them but the package got build anyway ;) I will change libsquish to 
cmake when bumping to 1.13.

Thanks for the review!

Regards, Bernd

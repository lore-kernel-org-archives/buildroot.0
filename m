From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 09:06:42 +0200
Subject: [Buildroot] [RFC/PATCH v3 07/11] package/kodi: Enable install
	to STAGING_DIR, needed for audioencoder addons
References: <1413661503-5382-1-git-send-email-bernd.kuhls@t-online.de>
 <1413661503-5382-8-git-send-email-bernd.kuhls@t-online.de>
 <20141018223754.GA14899@free.fr>
Message-ID: <XnsA3CB5CB0EFC36berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:20141018223754.GA14899 at free.fr:

>> +# needed for audioencoder addons
>> +KODI_INSTALL_STAGING = YES
> 
> I'm not sure I understand why you need Kodi in staging.

Hi,

the build system (cmake) of all audioencoder addons checks for an installed 
xbmc/kodi, for example:

https://github.com/xbmc/audioencoder.flac/blob/master/CMakeLists.txt#L9

I will update the comments.

Regards, Bernd

From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 17 Feb 2017 20:03:53 +0100
Subject: [Buildroot] [PATCH v3 01/38] package/libdvdcss: add
	Kodi-specific patches
References: <20170204114451.20935-2-bernd.kuhls@t-online.de>
 <20170204230821.GA3805@free.fr>
 <XnsA7135B7CF93B2berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20170205212408.GC3562@free.fr>
 <i6vmmdxipi.ln2@ID-313208.user.individual.net>
 <rk5nmdxipi.ln2@ID-313208.user.individual.net>
 <20170209232937.2a071f11@free-electrons.com>
 <XnsA719AD8F76801ID313208userindividu@bernd-kuhls.de>
 <20170212135110.61e55c66@free-electrons.com>
 <XnsA71FC7BAC87A6ID313208userindividu@bernd-kuhls.de>
 <20170217185434.GB3470@free.fr>
Message-ID: <p1ujndxbuq.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Am Fri, 17 Feb 2017 19:54:34 +0100 schrieb Yann E. MORIN:

> Except that those managed by Kodi would be downloaded at configure or
> build time, not when doing 'make source', so we could not do an off-line
> build. That alone would warrant they be separate packages, IMHO.

'make source' just downloaded

 https://github.com/xbmc/libdvdcss/archive/2f12236.tar.gz
 https://github.com/xbmc/libdvdnav/archive/43b5f81.tar.gz
 https://github.com/xbmc/libdvdread/archive/17d99db.tar.gz

here. You can find my git tree for testing here:
https://github.com/bkuhls/buildroot/tree/kodi_cmake

By using _EXTRA_DOWNLOADS an offline build should be possible:
https://github.com/bkuhls/buildroot/blob/kodi_cmake/package/kodi/kodi.mk#L124

Regards, Bernd

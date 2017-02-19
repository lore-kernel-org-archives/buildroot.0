From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Feb 2017 09:43:22 +0100
Subject: [Buildroot] [PATCH v3 01/38] package/libdvdcss: add
	Kodi-specific patches
References: <XnsA7135B7CF93B2berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20170205212408.GC3562@free.fr>
 <i6vmmdxipi.ln2@ID-313208.user.individual.net>
 <rk5nmdxipi.ln2@ID-313208.user.individual.net>
 <20170209232937.2a071f11@free-electrons.com>
 <XnsA719AD8F76801ID313208userindividu@bernd-kuhls.de>
 <20170212135110.61e55c66@free-electrons.com>
 <XnsA71FC7BAC87A6ID313208userindividu@bernd-kuhls.de>
 <20170217185434.GB3470@free.fr>
 <p1ujndxbuq.ln2@ID-313208.user.individual.net>
 <20170217215231.GD3470@free.fr>
Message-ID: <ae2ondx2h3.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 17 Feb 2017 22:52:31 +0100 schrieb Yann E. MORIN:

> If the patched version are still compatible with the unpatched version
> (i.e. it offers a superset of the API), then that could probably be
> acceptable (and thus forget about that case in my previous table).

Hi,

I tried to patch the existing buildroot libdvd* packages with the Kodi-
specific stuff and did a successful runtime test, building static libs is 
not necessary anymore with the CMake build system :)

You can find the current patch series here as RFC:
https://github.com/bkuhls/buildroot/commits/kodi_cmake_libdvd

Please note that I am using HEAD of the Krypton branch because one of my 
patches needed for cross-compiling already got merged upstream, the iconv 
one is pending.

Regards, Bernd

From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 22 Apr 2017 22:40:45 +0200
Subject: [Buildroot] [PATCH v5 08/34] package/kodi: bump to version
	17.1-Krypton
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-9-bernd.kuhls@t-online.de>
 <20170422202457.GJ15086@scaer>
Message-ID: <dnrssdx9sb.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 22 Apr 2017 22:24:57 +0200 schrieb Yann E. MORIN:

>>  package/kodi/0002-cmake-add-FindIconv.cmake.patch  |  171 +++
> 
> That patch to find iconv is a feature patch (add support for building
> under uClibc). We avoid having feature patches. At best make it a
> separate changeset.

Hi Yann,

building Kodi 16 with uClibc is already possible, so imho it is not a 
feature patch, instead it fixes the problem mentioned in the patch 
description.

Regards, Bernd

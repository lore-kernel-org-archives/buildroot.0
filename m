From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 13 May 2017 18:00:42 +0200
Subject: [Buildroot] [for-next 3/3] package/gcc: remove gcc 4.8
References: <20170513113732.8154-1-romain.naour@gmail.com>
 <20170513113732.8154-3-romain.naour@gmail.com>
Message-ID: <a6njudxk1o.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 13 May 2017 13:37:32 +0200 schrieb Romain Naour:

> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8

Hi,

lots of packages contain

	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8

like Kodi:
https://git.buildroot.net/buildroot/tree/package/kodi/Config.in#n40

With this patch applied these packages can not be selected anymore 
because you removed the option BR2_TOOLCHAIN_GCC_AT_LEAST_4_8.

Regards, Bernd

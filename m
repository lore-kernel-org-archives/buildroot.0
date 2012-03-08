From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
Date: Thu, 8 Mar 2012 15:57:00 +0100
Subject: [Buildroot] Linaro 2012.02 toolchain: pixman build failure
In-Reply-To: <4F58C7D9.2080205@visionsystems.de>
References: <4F58C7D9.2080205@visionsystems.de>
Message-ID: <20120308155700.033c9f81@eb-e6520>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 08 Mar 2012 15:53:13 +0100,
Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :

> I was testing the latest Linaro toolchain and it failed building pixman:
> 
> .../...
> ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wslldi
> ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wor'
> ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wunpckilb'
> ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wsrldi'
> ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_waddbus'
> ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_waddhus'
> ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wsrlhi'
> ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wxor'
> ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wpackhus'
> ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wand'
> ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wunpckihb'
> ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wzero'
> ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_walign'
> ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wmulul'
> ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wslldi'
> ../pixman/.libs/libpixman-collect2: 1.so: ld returned 1 exit status
> 
> Any idea?
> 
try to add : --disable-arm-iwmmxt to configure

Eric
-- 
http://eukrea.com/en/news/104-2012

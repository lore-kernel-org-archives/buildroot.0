From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Aug 2014 14:32:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: Bump to version 2.3.1
In-Reply-To: <XnsA37E88A2EAAF0berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1407017477-8540-1-git-send-email-bernd.kuhls@t-online.de>
 <20140803102404.7d7fa4b6@free-electrons.com>
 <XnsA37E88A2EAAF0berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20140803143250.362afa9e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 03 Aug 2014 13:25:55 +0200, Bernd Kuhls wrote:

> output/build/ffmpeg-2.3.1/config.log contains
> ffconf.Vyn5TU6p.c:(.text+0x1f): undefined reference to `fminf'
> 
> which leads to 
> 
> #define HAVE_FMINF 0
> 
> in output/build/ffmpeg-2.3.1/config.h which seems true when looking at
> http://git.uclibc.org/uClibc/tree/libm/float_wrappers.c#n48

So, this should work without the need for your patch, right?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

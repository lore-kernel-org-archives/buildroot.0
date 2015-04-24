From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Apr 2015 22:53:12 +0200
Subject: [Buildroot] [PATCH 06/10 v7] package/nvidia-driver: Add gl.pc
In-Reply-To: <XnsA486E28EE4A92berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <cover.1423597914.git.yann.morin.1998@free.fr>
 <09718509727afa315acf9e7b999f71243f2a67c3.1423597914.git.yann.morin.1998@free.fr>
 <XnsA486E28EE4A92berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20150424205312.GI4244@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-04-24 22:16 +0200, Bernd Kuhls spake thusly:
[--SNIP--]
> > +     $(INSTALL) -D -m 0644 package/nvidia-driver/gl.pc 
> $(STAGING_DIR)/usr/lib/pkgconfig/gl.pc
> 
> the nvidia package should not install gl.pc when
> BR2_PACKAGE_NVIDIA_DRIVER_XORG is not set because in this case nvidia-driver 
> is not a provider for libgl.

Indeed. I'll cook up a patch.

Thanks for the report!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

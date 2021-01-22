From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 22 Jan 2021 19:41:11 +0100
Subject: [Buildroot] [PATCH 2/2] package/libgcrypt: bump to version 1.9.0
In-Reply-To: <20210121204357.2359264-2-fontaine.fabrice@gmail.com>
References: <20210121204357.2359264-1-fontaine.fabrice@gmail.com>
 <20210121204357.2359264-2-fontaine.fabrice@gmail.com>
Message-ID: <20210122184111.GF2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-21 21:43 +0100, Fabrice Fontaine spake thusly:
> -LIBGCRYPT_VERSION = 1.8.7
> +LIBGCRYPT_VERSION = 1.9.0

This is causing quite some build failures on uClibc:

    http://autobuild.buildroot.org/?reason=libgcrypt-1.9.0

    http://autobuild.buildroot.org/results/7aa/7aa6aefb7ba9c537cbbcb6b0afc361cc1db0de58/

    /srv/storage/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/5.5.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ./.libs/libgcrypt.so: undefined reference to `_gcry_sha512_transform_armv7_neon'

Care to have a look, please/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

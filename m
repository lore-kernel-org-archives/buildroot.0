From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Apr 2016 22:18:48 +0200
Subject: [Buildroot] [PATCH v15 00/27] package/freeswitch: new package
In-Reply-To: <1460906689-29900-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460906689-29900-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160417221848.029ce381@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Apr 2016 17:24:22 +0200, Bernd Kuhls wrote:

> Bernd Kuhls (27):
>   package/freeswitch: new package
>   package/freeswitch: enable optional modules
>   package/freeswitch: add optional dependency to libedit
>   package/freeswitch: enable mod_enum
>   package/freeswitch: add optional dependency to libpng
>   package/freeswitch: add optional dependency to unixodbc
>   package/freeswitch: add optional dependency to freetype
>   package/freeswitch: enable mod_yaml
>   package/freeswitch: enable mod_lua
>   package/freeswitch: enable mod_bv
>   package/freeswitch: enable mod_codec2
>   package/freeswitch: add optional dependency to libg7221
>   package/freeswitch: enable mod_ilbc
>   package/freeswitch: enable mod_isac
>   package/freeswitch: enable mod_opus
>   package/freeswitch: enable mod_portaudio
>   package/freeswitch: enable mod_silk
>   package/freeswitch: enable mod_sndfile
>   package/freeswitch: enable mod_alsa
>   package/freeswitch: enable mod_soundtouch
>   package/freeswitch: add optional dependency to xz
>   package/freeswitch: enable mod_memcache
>   package/freeswitch: enable mod_imagick
>   package/freeswitch: enable mod_cv
>   package/freeswitch: enable mod_shout
>   package/freeswitch: add optional dependency to openldap

I've applied those initial 26 patches.

>   package/freeswitch: enable video support

I've left out this one for now, I'll make some comments specifically on
it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

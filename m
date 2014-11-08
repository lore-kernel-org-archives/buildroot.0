From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Nov 2014 17:49:07 +0100
Subject: [Buildroot] [RFC/PATCH v5 00/13] package/kodi: Bump version to
 14.0b2-Helix
In-Reply-To: <1415458426-23645-1-git-send-email-bernd.kuhls@t-online.de>
References: <1415458426-23645-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141108164907.GC7925@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-11-08 15:53 +0100, Bernd Kuhls spake thusly:
> this patchset is a RFC and not meant to be committed to buildroot git yet.
[--SNIP--]
>  package/alsa-utils/Config.in                     |    1 -
>  package/alsa-utils/alsa-utils-0001-libintl.patch |   23 ----
>  package/alsa-utils/alsa-utils.mk                 |   11 +-
>  package/ffmpeg/ffmpeg-0001-fminf.patch           |   47 ++++++++
>  package/lame/lame.mk                             |   13 ---
>  package/openssl/openssl.mk                       |    2 -
>  package/uclibc/0.9.33.2/uclibc-0063-fminf.patch  |  127 ----------------------
>  package/x11r7/xserver_xorg-server/Config.in      |    1 -
>  8 files changed, 48 insertions(+), 177 deletions(-)
>  delete mode 100644 package/alsa-utils/alsa-utils-0001-libintl.patch
>  create mode 100644 package/ffmpeg/ffmpeg-0001-fminf.patch
>  delete mode 100644 package/uclibc/0.9.33.2/uclibc-0063-fminf.patch

BTW, this diffstat looks weird, as none of your patches (unless I missed
some) do touch alsa-utils, openssl, uClibc or x11r7... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

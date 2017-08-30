From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 23:28:00 +0200
Subject: [Buildroot] [PATCH/next 1/3] package/kodi: bump to version 17.4
In-Reply-To: <20170822201526.3285-1-bernd.kuhls@t-online.de>
References: <20170822201526.3285-1-bernd.kuhls@t-online.de>
Message-ID: <20170830232800.126ae910@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Aug 2017 22:15:24 +0200, Bernd Kuhls wrote:
> Removed patch 0003, applied upstream:
> https://github.com/xbmc/xbmc/commit/5fa10ff6b1b60abee172296d9c1dec8dfc10615c
> 
> -DWITH_FFMPEG is needed due to commit
> https://github.com/xbmc/xbmc/commit/5ba6eb7cadc41d5eb86ef94e3661b833b62953ff
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../kodi-jsonschemabuilder.mk                      |  2 +-
>  package/kodi-texturepacker/kodi-texturepacker.mk   |  2 +-
>  .../kodi/0003-FTPParse.cpp-use-std-string.patch    | 91 ----------------------
>  package/kodi/kodi.hash                             |  2 +-
>  package/kodi/kodi.mk                               |  3 +-
>  5 files changed, 5 insertions(+), 95 deletions(-)
>  delete mode 100644 package/kodi/0003-FTPParse.cpp-use-std-string.patch

All three patches applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

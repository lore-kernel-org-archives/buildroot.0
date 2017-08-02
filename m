From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 22:54:26 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/kodi: Add support for more
 archs
In-Reply-To: <20170802162942.6989-1-bernd.kuhls@t-online.de>
References: <20170802162942.6989-1-bernd.kuhls@t-online.de>
Message-ID: <20170802225426.6058cc5f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 Aug 2017 18:29:42 +0200, Bernd Kuhls wrote:
> For the autoconf-based build system it was necessary to allow each
> supported architecture separatly:
> https://github.com/xbmc/xbmc/blob/Krypton/m4/xbmc_arch.m4
> 
> For the CMake build system this is not necessary anymore so we only
> blacklist archs in Config.in known to be broken.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v4: removed sunxi mali patches from patch series
> v3: fixed "KODI_CXX_FLAGS +=" (Samuel)
> v2: rebased

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

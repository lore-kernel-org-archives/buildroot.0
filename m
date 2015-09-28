From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Sep 2015 22:14:57 +0200
Subject: [Buildroot] [PATCH 1/2] package/libbluray: bump version
In-Reply-To: <1443468477-25001-1-git-send-email-bernd.kuhls@t-online.de>
References: <1443468477-25001-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150928221457.322be064@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Mon, 28 Sep 2015 21:27:56 +0200, Bernd Kuhls wrote:
> Kodi 16.x-Jarvis depends on libbluray > 0.7.0
> https://github.com/xbmc/xbmc/commit/329190a0323e332dd9fa9ad14fcbf3b2d92afe77
> 
> Also enable UDF support like in OpenElec:
> https://github.com/OpenELEC/OpenELEC.tv/commit/50d086b1b21645b0baec881a72fc3c4476f7ade5
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libbluray/libbluray.hash | 4 ++--
>  package/libbluray/libbluray.mk   | 4 +++-
>  2 files changed, 5 insertions(+), 3 deletions(-)

Both patches applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

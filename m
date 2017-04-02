From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Apr 2017 23:45:08 +0200
Subject: [Buildroot] [PATCH 2/3] package/libva-intel-driver: bump
 version to 1.8.0
In-Reply-To: <20170402081327.2195-2-bernd.kuhls@t-online.de>
References: <20170402081327.2195-1-bernd.kuhls@t-online.de>
 <20170402081327.2195-2-bernd.kuhls@t-online.de>
Message-ID: <20170402234508.41be4f62@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Apr 2017 10:13:26 +0200, Bernd Kuhls wrote:
> Autoreconf is not necessary anymore after a fix was commit upstream:
> https://github.com/01org/intel-vaapi-driver/commit/fe6280841dfaaee94e8664517420f351cd334c86
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libva-intel-driver/libva-intel-driver.hash | 4 +++-
>  package/libva-intel-driver/libva-intel-driver.mk   | 7 +++----
>  2 files changed, 6 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

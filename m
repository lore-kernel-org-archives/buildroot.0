From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 21:44:51 +0200
Subject: [Buildroot] [PATCH 1/3] package/tvheadend: bump version
In-Reply-To: <20170408151804.11102-1-bernd.kuhls@t-online.de>
References: <20170408151804.11102-1-bernd.kuhls@t-online.de>
Message-ID: <20170408214451.1f828d94@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  8 Apr 2017 17:18:02 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/tvheadend/tvheadend.hash | 3 ++-
>  package/tvheadend/tvheadend.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
> index afd651003..fe99e4553 100644
> --- a/package/tvheadend/tvheadend.hash
> +++ b/package/tvheadend/tvheadend.hash
> @@ -1,2 +1,3 @@
>  # Locally computed
> -sha256 e58f5b2fded91fa085961402db26b54d5338c70e5bebdb0f34d55beb4d5551b4  tvheadend-b142383a7cf51180e00ebb1c13205c14d24338dc.tar.gz
> +sha256 94efc13b6c80c204dc4e3cf2ac79632f3c2cafe9cad4ee8948a71be6e4569a16  tvheadend-5cbaac172b4997fbf89667d79ac6e03b46460060.tar.gz
> +

This empty new line at the end of the file was not needed, so I've
removed it and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

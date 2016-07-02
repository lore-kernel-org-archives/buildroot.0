From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 16:52:17 +0200
Subject: [Buildroot] [PATCH 7/9] package/systemd: Remove
 systemd-bootchart
In-Reply-To: <1467467955-14609-7-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467467955-14609-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1467467955-14609-7-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20160702165217.1f88a2cb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jul 2016 15:59:13 +0200, Maxime Hadjinlian wrote:
> Since systemd v230, bootchart has been removed from the source of
> systemd and now lives in its own repository.
> A new package will be added in the next commit.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  Config.in.legacy           |  6 ++++++
>  package/systemd/Config.in  | 10 ----------
>  package/systemd/systemd.mk |  6 ------
>  3 files changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 70f6e0a..357f382 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -376,6 +376,12 @@ config BR2_PACKAGE_SYSTEMD_COMPAT
>  	  removed. Theses libraries have been useless since a few version, and
>  	  have been fully dropped from the source since v230.
>  
> +config BR2_PACKAGE_SYSTEMD_BOOTCHART
> +	bool "systemd-bootchart option has been removed"

Same: wrong location in Config.in.legacy.

Applied with this fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

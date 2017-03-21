From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 23:10:54 +0100
Subject: [Buildroot] [PATCH 1/2] tslib: add project overview page to
 help text
In-Reply-To: <1490115159-11252-1-git-send-email-martin.kepplinger@ginzinger.com>
References: <1490115159-11252-1-git-send-email-martin.kepplinger@ginzinger.com>
Message-ID: <20170321231054.66966908@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Mar 2017 17:52:38 +0100, Martin Kepplinger wrote:
> Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
> ---
>  package/tslib/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/tslib/Config.in b/package/tslib/Config.in
> index bc5d790..e3c8ec2 100644
> --- a/package/tslib/Config.in
> +++ b/package/tslib/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_TSLIB
>  	  Tslib is a filtering layer for touchscreen panel events.
>  
>  	  https://github.com/kergoth/tslib
> +	  http://tslib.org

Actually I believe keeping only tslib.org makes more sense, so I've
tweaked your patch and dropped the github.com address from there. The
Config.in help text should really reference the upstream project "home
page".

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

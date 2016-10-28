From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Oct 2016 15:17:34 +0200
Subject: [Buildroot] [PATCH] adwaita-icon-theme: install to staging
In-Reply-To: <1477660403-5847-1-git-send-email-gustavo@zacarias.com.ar>
References: <1477660403-5847-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20161028151734.5bf91d10@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Oct 2016 10:13:23 -0300, Gustavo Zacarias wrote:
> This is required for the upcoming evince package which checks for adwaita
> presence via pkgconfig file, which normally resides in staging.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/adwaita-icon-theme/adwaita-icon-theme.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

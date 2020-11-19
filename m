From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 19 Nov 2020 22:39:25 +0100
Subject: [Buildroot] [PATCH] package/qt5/qt5base: fix typo
In-Reply-To: <20201119212545.3459584-1-jzignego@hedcontrols.com>
References: <20201119212545.3459584-1-jzignego@hedcontrols.com>
Message-ID: <20201119223925.0cf521a2@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jeff,

On Thu, 19 Nov 2020 15:25:45 -0600, jzignego at hedcontrols.com wrote:

> From: Jeff Zignego <jzignego@hedcontrols.com>
>
> Fix typo from 109df4deba86839704d902204d130714e32df0fa that added this
> option.
>
> Signed-off-by: Jeff Zignego <jzignego@hedcontrols.com>
> ---
>  package/qt5/qt5base/qt5base.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index fa92625738..4cd5980f0b 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -255,7 +255,7 @@ QT5BASE_CONFIGURE_OPTS += -no-journald
>  endif
>
>  ifeq ($(BR2_PACKAGE_QT5BASE_SYSLOG),y)
> -QT5BASE_CONIGURE_OPTS += -syslog
> +QT5BASE_CONFIGURE_OPTS += -syslog
>  else
>  QT5BASE_CONFIGURE_OPTS += -no-syslog
>  endif

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter

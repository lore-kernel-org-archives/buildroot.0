From: Christian Stewart <christian@paral.in>
Date: Sat, 6 Mar 2021 14:44:31 -0800
Subject: [Buildroot] [PATCH] package/runc: cleanup the CPE_ID variables
In-Reply-To: <20210306215027.2421773-1-yann.morin.1998@free.fr>
References: <20210306215027.2421773-1-yann.morin.1998@free.fr>
Message-ID: <CA+h8R2qX9Fd6pg58iT2qtE6_vugJoJbX7KN-in=baOMHLNRUiA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sat, Mar 6, 2021 at 1:50 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> The CPE variables are derived from the package upstream values, so they
> must be set from the package values, not the other way around.
>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Cc: Christian Stewart <christian@paral.in>

[snip]

> +RUNC_VERSION = $(RUNC_VERSION_MAJOR)-$(RUNC_VERSION_MINOR)
> +RUNC_CPE_ID_VERSION = $(RUNC_VERSION_MAJOR)
> +RUNC_CPE_ID_UPDATE = $(RUNC_VERSION_MINOR)

Thanks, LGTM.

Reviewed-by: Christian Stewart <christian@paral.in>

Best regards,
Christian

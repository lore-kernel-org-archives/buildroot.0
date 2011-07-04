From: Will Newton <will.newton@gmail.com>
Date: Mon, 4 Jul 2011 15:00:46 +0100
Subject: [Buildroot] [PATCH 5/6] gst-plugins-base: depend on orc if it
	is enabled
In-Reply-To: <1309787685-22269-6-git-send-email-s.neumann@raumfeld.com>
References: <1309787685-22269-1-git-send-email-s.neumann@raumfeld.com>
 <1309787685-22269-6-git-send-email-s.neumann@raumfeld.com>
Message-ID: <CAFbHwiRa18nqu+XzPLee1DjxZU1KLMwGjDaOOhVwHL=mLsqr=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 4, 2011 at 2:54 PM, Sven Neumann <s.neumann@raumfeld.com> wrote:

Hi Sven,

> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
> ---
> ?.../gst-plugins-base/gst-plugins-base.mk ? ? ? ? ? | ? ?6 +++++-
> ?1 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
> index 79ced30..74e0622 100644
> --- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
> +++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
> @@ -12,7 +12,7 @@ GST_PLUGINS_BASE_INSTALL_STAGING = YES
> ?# and the host has a freetype-config script, then the host
> ?# include dirs are added to the search path causing trouble
> ?GST_PLUGINS_BASE_CONF_ENV =
> - ? ? ? ? ? ? ? FT2_CONFIG=/bin/false \
> + ? ? ? ? ? ? ? FT2_CONFIG=/bin/ilfalse \
> ? ? ? ? ? ? ? ?ac_cv_header_stdint_t="stdint.h"

What is the intent of this change? Typo?

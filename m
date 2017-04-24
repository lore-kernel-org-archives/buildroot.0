From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Mon, 24 Apr 2017 14:27:25 +0200
Subject: [Buildroot] [PATCH] x11vnc: update to 0.9.14
In-Reply-To: <1493036541-26331-1-git-send-email-martin.kepplinger@ginzinger.com>
References: <1493036541-26331-1-git-send-email-martin.kepplinger@ginzinger.com>
Message-ID: <3cc20a82-673d-f87b-e5c6-0acc428cfb1c@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-04-24 14:22, Martin Kepplinger wrote:
> This uses x11vnc's new upstream location, github, via https. Autoreconf is
> added, because it's really only a code snapshot release.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
> ---
>  package/x11vnc/x11vnc.hash | 2 +-
>  package/x11vnc/x11vnc.mk   | 9 +++++++--
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/package/x11vnc/x11vnc.hash b/package/x11vnc/x11vnc.hash
> index 5828b12..0da7765 100644
> --- a/package/x11vnc/x11vnc.hash
> +++ b/package/x11vnc/x11vnc.hash
> @@ -1,2 +1,2 @@
>  # Locally computed:
> -sha256  f6829f2e629667a5284de62b080b13126a0736499fe47cdb447aedb07a59f13b  x11vnc-0.9.13.tar.gz
> +sha256  45f87c5e4382988c73e8c7891ac2bfb45d8f9ce1196ae06651c84636684ea143  0.9.14.tar.gz


It's ugly to have 0.9.14.tar.gz. Is there a buildroot-style solution to
this?

And other than that, is there a reason why x11vnc had not been updated
before? 0.9.14 is one and a half years old.

thanks

                       martin

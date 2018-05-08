From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 8 May 2018 17:45:57 +0200
Subject: [Buildroot] [RFC PATCH 1/2] support/kconfig: Add missing target
 to README.buildroot
In-Reply-To: <20180425160429.21330-1-petr.vorel@gmail.com>
References: <20180425160429.21330-1-petr.vorel@gmail.com>
Message-ID: <CAB1t1Cy5EaxwdeC3pYZHz=jRP2mXEGRNfJwn19p8jwUezfAqkg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 25 April 2018 at 18:04, Petr Vorel <petr.vorel@gmail.com> wrote:

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  support/kconfig/README.buildroot | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/support/kconfig/README.buildroot b/support/kconfig/README.
> buildroot
> index 62e3a11b1e..3140713b39 100644
> --- a/support/kconfig/README.buildroot
> +++ b/support/kconfig/README.buildroot
> @@ -15,6 +15,7 @@ Then verify the toplevel targets work:
>         config
>         defconfig
>         menuconfig
> +       nconfig
>         xconfig
>         gconfig
>         oldconfig
> --
> 2.16.3
>

Ping.

Kind regards,
Petr
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180508/a4320e79/attachment-0001.html>

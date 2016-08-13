From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 13 Aug 2016 10:08:56 -0400
Subject: [Buildroot] [PATCH] package/ustr: don't run ldconfig (and
 certainly not concurrently)
In-Reply-To: <1471096801-9875-1-git-send-email-yann.morin.1998@free.fr>
References: <1471096801-9875-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CANxTyt4NSqdwbGg2iRKNXsXD5LLgw=-OfNYJeCawXJiJCaPuPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sat, Aug 13, 2016 at 10:00 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
...snip...
> diff --git a/package/ustr/0002-ln-force.patch b/package/ustr/0002-ln-force.patch
> new file mode 100644
> index 0000000..18afe4d
> --- /dev/null
> +++ b/package/ustr/0002-ln-force.patch
> @@ -0,0 +1,39 @@
> +Makefile: forcibly create library symlinks
> +
> +Aboids failures when the symlink already exists (it is re-symlinked).
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +
...snip...

Typo, /Aboids/Avoids/

Regards,
Danomi -

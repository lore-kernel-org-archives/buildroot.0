From: Anders Darander <anders.darander@gmail.com>
Date: Tue, 22 Dec 2009 09:31:30 +0100
Subject: [Buildroot] BR + CT-NG integration
In-Reply-To: <200912212351.11487.yann.morin.1998@anciens.enib.fr>
References: <200912212351.11487.yann.morin.1998@anciens.enib.fr>
Message-ID: <2c9a759f0912220031q1e1c0063ja28c1072d377ce84@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

I think that the plan looks good, and that it will be beneficial for Buildroot.

On Mon, Dec 21, 2009 at 23:51, Yann E. MORIN
<yann.morin.1998@anciens.enib.fr> wrote:
> - rely on user-supplied external toolchain, built with crosstool-NG
>
> ?AFAICS, this is currently mostly working, even if some configuration
> ?items should be reviewed to make it work seamlessly.
> ?It was also pointed out that some of the toolchain options should be
> ?made easily available to buildroot (such as endianness, networking
> ?support (IPv4, IPv6)...). I think that this is easily achievable,
> ?provided the list of options is known.

If it's not already on the list, I'd like you to add the debug-root as
a toolchain option available for buildroot. My reason is that I'd like
to update and get my patch [1] to install gdbserver from crosstool-NG
to the target system integrated into buildroot.

I think that it would be possible to create a "cleaner" patch, if such
an option where available to buildroot.

Thanks in advance.

Regards,
Anders Darander

[1] http://lists.busybox.net/pipermail/buildroot/2009-November/030254.html

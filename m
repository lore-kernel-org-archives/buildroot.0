From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 14 Apr 2017 10:43:33 -0300
Subject: [Buildroot] [PATCH v3] atest: new package
In-Reply-To: <20170414055002.r4swrkh3kzx65rlc@tarshish>
References: <1491759842-27293-1-git-send-email-festevam@gmail.com>
 <20170413224848.393b11be@free-electrons.com>
 <CAOMZO5Ch5+VOHYuO8W4r3wZSBsXSzLSuXvvNsNyC2Fn--nWc5Q@mail.gmail.com>
 <20170414055002.r4swrkh3kzx65rlc@tarshish>
Message-ID: <CAOMZO5AD+p=gL5ztR_bpv0kunDCp4udfHq=8JQuwe8a3gZ0u2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Fri, Apr 14, 2017 at 2:50 AM, Baruch Siach <baruch@tkos.co.il> wrote:

> We want the comment to appear when the packages can't build because of
> toolchain properties. So the committed dependency looks correct. That is, the
> comment appears when the toolchain uses uClibc or doesn't support threads.
>
> The !BR2_bfin dependency is there to hide the comment when the architecture is
> incompatible. The comment will be misleading (changing toolchain won't help),
> and the user can't change the architecture selection in most cases.

Thanks for your clarification!

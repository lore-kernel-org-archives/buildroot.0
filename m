From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 4 Mar 2018 20:29:27 -0300
Subject: [Buildroot] Defconfigs failing to build with gcc 6.x
In-Reply-To: <20180304224808.566fa00d@windsurf.home>
References: <20180304224808.566fa00d@windsurf.home>
Message-ID: <CAOMZO5DXmGWSbfE9PEp+srYkM8ieMX0NYOmyOgza0cuSHsjr9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Mar 4, 2018 at 6:48 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

>  - freescale_p1010rdb_pa_defconfig
>
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/55306827
>
>    Gustavo was taking care of this board. I'm adding Fabio (Estevam)
>    from Freescale/NXP as a replacement, in case he is
>    interested. Fabio (Estevam): let me know if you're interested. If
>    not, we'll remove this defconfig.

I don't have access to this board, but I can try to bump the kernel to
4.15.7 and see if it builds fine.

Regards,

Fabio Estevam

From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 8 Apr 2020 13:52:22 -0300
Subject: [Buildroot] [PATCH] package/mesa3d: Select more options for
 freedreno
In-Reply-To: <20200406222540.424c13f8@windsurf>
References: <20200330231114.22168-1-festevam@gmail.com>
 <20200406222540.424c13f8@windsurf>
Message-ID: <CAOMZO5C8Mod3uF=uCcBSpANqc+kKSDaOugbMDEx-3+0c9hnJ4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Apr 6, 2020 at 5:25 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> So, what I'd prefer to see is:
>
>  - A patch that drops the select BR2_PACKAGE_MESA3D_OPENGL_EGL from the
>    etnaviv mesa3d option.
>
>  - A patch that adds just the select BR2_PACKAGE_LIBDRM_FREEDRENO,
>    perhaps with a comment that says it's a runtime dependency.
>
> What do you think ?

I have just submitted a patch series with your proposal.

Thanks

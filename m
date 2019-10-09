From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 9 Oct 2019 14:26:03 -0300
Subject: [Buildroot] glmark2 build failure
In-Reply-To: <20191008230231.11da9a76@gmx.net>
References: <CAOMZO5BC0CyEpPyJxeXWYf8ZqY+K10tEQw2W5nJZ2S9viM0e4g@mail.gmail.com>
 <20191007173640.5ec12ff1@windsurf>
 <CAOMZO5BiMG8TWDd93abA2aWXCyTZ3c7LYByg907oMCTmhqcQTg@mail.gmail.com>
 <20191008230231.11da9a76@gmx.net>
Message-ID: <CAOMZO5AFOE+L5WGt5s_=6EcG_t2VsA2qwYOQ3C+8rNndF6et0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, Oct 8, 2019 at 6:02 PM Peter Seiderer <ps.report@gmx.net> wrote:

> Changing
>
>         System-Configuration --> /dev management --> Dyanmic using devtempfs + mdev
>
> to
>
>         System-Configuration --> /dev management --> Dyanmic using devtempfs + eudev
>
> fixes the glmark2 compile failure for the imx6-sabresd_qt5_defconfig...

Thanks, I have sent some patches to fix imx6-sabresd_qt5_defconfig
based on your suggestions.

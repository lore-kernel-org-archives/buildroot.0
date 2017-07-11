From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 11 Jul 2017 16:47:04 -0300
Subject: [Buildroot] [PATCH] olimex_imx233: refactor with genimage.sh
In-Reply-To: <CAB0FRsu64aDtXhaXNSbjNc67SuK+0BOh+KhZ3emeN73CV-XBjw@mail.gmail.com>
References: <20170701153433.11906-1-francois.perrad@gadz.org>
 <20170701174510.08a506bd@windsurf.home>
 <CAB0FRsu64aDtXhaXNSbjNc67SuK+0BOh+KhZ3emeN73CV-XBjw@mail.gmail.com>
Message-ID: <CAOMZO5Bom0DKcY=qgfw9CVF87ohLocxh3ML3uCMD95b027jY9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 10, 2017 at 3:25 PM, Fran?ois Perrad
<francois.perrad@gadz.org> wrote:
>
>
> First, I like common tools which avoid duplication of effort.
>
> I introduced the use of the common mxs script on November 2016, soon after
> its creation by Fabio.
>
> But, I dislike the level indirection given by the template of image
> description (the use of this template is good inside board/freescale, but
> not outside).

Not sure if this is a good argument for such change.

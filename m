From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 9 Oct 2019 19:36:23 +0200
Subject: [Buildroot] [PATCH 1/1] scanpypi: write every license file once
In-Reply-To: <20191008232209.254e3c0d@windsurf>
References: <20191008090404.26700-1-asafka7@gmail.com>
 <20191008090404.26700-2-asafka7@gmail.com>
 <20191008232209.254e3c0d@windsurf>
Message-ID: <CAGm1_kvXJGA0VYoC86zGLxRk405K3LDmwJ=9B=UDxvm+25+Dxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 8, 2019 at 11:22 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> +Yegor in Cc.
>
> On Tue,  8 Oct 2019 12:04:04 +0300
> Asaf Kahlon <asafka7@gmail.com> wrote:
>
> > On some cases, when the package contains multiple license files
> > and some of them from the same type, the scanpypi script will write
> > the same license type more than once under _LICENSE.
> > Hence, before creating the _LICENSE variable, we'll remove every
> > possible duplication.
> >
> > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> > ---
> >  utils/scanpypi | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Yegor, it would be nice to have your review on this patch. Thanks!

On Sun, Oct 6, 2019 at 6:33 PM Adam Ford <aford173@gmail.com> wrote:
>
> There are two checks to see if the manual gpio is configured, but
> these the check is seeing if the structure is NULL instead it
> should check to see if there are CTS and/or RTS pins defined.
>
> This patch uses checks for those individual pins instead of
> checking for the structure itself to restore auto RTS/CTS.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

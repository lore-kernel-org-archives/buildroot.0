From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 24 Feb 2020 09:04:20 +0100
Subject: [Buildroot] [PATCH v3 07/12] support/scripts/pkg-stats: store
 pkg dir path
In-Reply-To: <9e7667c9-99e5-5c00-e413-415876cc5b61@railnova.eu>
References: <20200222085715.23769-1-heiko.thiery@gmail.com>
 <20200222085715.23769-8-heiko.thiery@gmail.com>
 <9e7667c9-99e5-5c00-e413-415876cc5b61@railnova.eu>
Message-ID: <CAEyMn7ZM1NGh=a4gnxMS1dWTsPdpDn=UtpO2KnM6w50V_YWtuA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI Titouan and all,

Am So., 23. Feb. 2020 um 16:20 Uhr schrieb Titouan Christophe
<titouan.christophe@railnova.eu>:
>
> Hello Heiko,
> On 2/22/20 9:57 AM, Heiko Thiery wrote:
> > This value can be used for later processing.
> >
> > In the buildroot-stats application this is used to create links pointing
> > to the git repo of buildroot.
> >
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>
> Reviewed-by: Titouan Christophe <titouan.christophe@railnova.eu>
> Tested-by: Titouan Christophe <titouan.christophe@railnova.eu>
>
> > ---
> >   support/scripts/pkg-stats | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> > index 90afcc2332..36b33586ef 100755
> > --- a/support/scripts/pkg-stats
> > +++ b/support/scripts/pkg-stats
> > @@ -64,6 +64,7 @@ class Package:
> >       def __init__(self, name, path):
> >           self.name = name
> >           self.path = path
> > +        self.pkg_path = os.path.dirname(path)
> >           self.infras = None
> >           self.license = None
> >           self.patch_count = 0
> >
>
> Regards,
>
> Titouan

Thank you,
Heiko

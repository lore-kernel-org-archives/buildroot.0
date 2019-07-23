From: Gilles Talis <gilles.talis@gmail.com>
Date: Tue, 23 Jul 2019 07:30:46 +0200
Subject: [Buildroot] [PATCH] package/ncdu: bump to version 1.14
In-Reply-To: <20190723041735.dujdtjnuvytxi23r@sapphire.tkos.co.il>
References: <1563818223-23023-1-git-send-email-gilles.talis@gmail.com>
 <20190723041735.dujdtjnuvytxi23r@sapphire.tkos.co.il>
Message-ID: <CAKcgs2y0yU4w-=sFW8f1L_F6By=XMWRO+rRyhLRLtbpnZatarA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch, all,

Thanks for your review.

Le mar. 23 juil. 2019 ? 06:17, Baruch Siach <baruch@tkos.co.il> a ?crit :
>
> Hi Gilles,
>
> On Mon, Jul 22, 2019 at 07:57:02PM +0200, Gilles Talis wrote:
> > Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> > ---
> >  package/ncdu/ncdu.hash | 8 ++++----
> >  package/ncdu/ncdu.mk   | 2 +-
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/package/ncdu/ncdu.hash b/package/ncdu/ncdu.hash
> > index 7326a15..97ac287 100644
> > --- a/package/ncdu/ncdu.hash
> > +++ b/package/ncdu/ncdu.hash
> > @@ -1,6 +1,6 @@
> > -# From http://dev.yorhel.nl/download/ncdu-1.13.tar.gz.{md5,sha1}
> > -md5 67239592ac41f42290f52ab89ff198be  ncdu-1.13.tar.gz
> > -sha1 3233c4185208d9989ac528a94817ed92dd59c773  ncdu-1.13.tar.gz
> > +# From http://dev.yorhel.nl/download/ncdu-1.14.tar.gz.{md5,sha1}
> > +md5 d26c0aa57728c19969c3c5036fa272a0  ncdu-1.14.tar.gz
> > +sha1 28c7003ad23d2e3a2d22d2c349bb0c7170752396  ncdu-1.14.tar.gz
> >
> >  # computed locally
> > -sha256 0ee47c3742a867ace26eb429cce593b54ab4ccb4c4a97d62e41363cbf80c8a24 COPYING
> > +sha256 a05f1fd38432052dc8588da66b8bf3e9e103e29a82c0b5d72c65d4d9fc830f2e COPYING
>
> What has changed in the license file? Please explain in the commit log.
this is a year bump (2018 -> 2019) in the copyright statement. Do you
think it is worth mentioning in the commit log? If you feel it is,
I'll send a v2.

thanks
Gilles.

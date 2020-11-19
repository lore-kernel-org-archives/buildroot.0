From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 19 Nov 2020 20:29:31 +0100
Subject: [Buildroot] [PATCH 1/3] package/qt5/qt5coap: new package
In-Reply-To: <20201119202052.3221b62c@gmx.net>
References: <20201119102150.714800-1-angelo@amarulasolutions.com>
 <20201119202052.3221b62c@gmx.net>
Message-ID: <20201119202931.2b493b09@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

On Thu, 19 Nov 2020 20:20:52 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> > diff --git a/package/qt5/qt5coap/qt5coap.hash b/package/qt5/qt5coap/qt5coap.hash
> > new file mode 100644
> > index 0000000000..423278e652
> > --- /dev/null
> > +++ b/package/qt5/qt5coap/qt5coap.hash
> > @@ -0,0 +1,6 @@
> > +# Hash locally calculated
> > +sha256  f2addd89e94fb3945fc6ee6db795b0736cd3396760b31e04c01cd02558c53e07  qt5coap-5.15.1.tar.gz
> > +
> > +# Hashes for license files:
> > +sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
> > +sha256 f827ad079686ba92cc94811e35492d0e8966f704008b6da9eeda0b659fb58a8d LICENSE.FDL
>
> Preferred style is with two spaces as separators (see [1]), with this fixed
> you can add my:
>
> Reviewed-by: Peter Seiderer <ps.report@gmx.net>
>
> Regards,
> Peter
>

...and the missing reference/link:

[1] https://buildroot.org/downloads/manual/manual.html#adding-packages-hash

  The format of this file is one line for each file for which to check the hash,
  each line with the following three fields separated by two spaces.

Regards,
Peter

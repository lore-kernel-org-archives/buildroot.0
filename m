From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Mon, 6 Jul 2020 17:14:48 -0300
Subject: [Buildroot] [PATCH] package/dvb-apps: add hash file
In-Reply-To: <20200706172151.GJ2273@scaer>
References: <20200704010533.1854-1-sergio.prado@e-labworks.com>
 <20200705145430.20cc4911@windsurf.home>
 <CANu7NGvssmqH8S9joP3-8hsgDNP6Q_1BP8PwR8s5Xx6knfWbnA@mail.gmail.com>
 <20200706172151.GJ2273@scaer>
Message-ID: <CANu7NGuQaTA4KAgTB6Hz3t1WvdA8nkQWnmyU-nszOBR_xxaL3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

Em seg., 6 de jul. de 2020 ?s 14:21, Yann E. MORIN <yann.morin.1998@free.fr>
escreveu:
>
> Sergio, All,
>
> On 2020-07-05 14:40 -0300, Sergio Prado spake thusly:
> > > > diff --git a/package/dvb-apps/dvb-apps.hash
b/package/dvb-apps/dvb-apps.hash
> > > > new file mode 100644
> > > > index 000000000000..a618cd7765d3
> > > > --- /dev/null
> > > > +++ b/package/dvb-apps/dvb-apps.hash
> > > > @@ -0,0 +1,6 @@
> > > > +# Locally computed:
> > > > +sha256
 099ccbad8dc7263cbeae4c8439f181fb0c031624d8afb40d00bb7462aa1ea645
> >  dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz
> > >
> > > Unfortunately, this doesn't work: it seems like our hashes for
> > > Mercurial fetched packages are not reproducible:
> > > ERROR: dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz has
wrong sha256 hash:
> > > ERROR: expected:
099ccbad8dc7263cbeae4c8439f181fb0c031624d8afb40d00bb7462aa1ea645
> > > ERROR: got     :
926208b7e711b4bab1a909ff9bf4e6ae54acdd30a46f5d5bd700ecb088fe1f57
> > Indeed I removed  [8]sources.buildroot.net from the mirrors location
and got the same error. What's interesting is that I
> > got the same hash as you. So the tar generated in our machines was
exactly the same, but it is different from the one hosted in
> > [9]sources.buildroot.net.
>
> As I explained in my previous reply, is that the archive on s.b.o. was
> generated before the hg backend was made reproducible. It now is.

Great, thanks. I'll send v2 with the correct hash. But for the build to
work, the archive should be deleted/updated on s.b.o.

Thanks,

Sergio Prado
Embedded Labworks
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200706/718306aa/attachment.html>

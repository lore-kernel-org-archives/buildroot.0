From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Mar 2013 00:50:51 +0100
Subject: [Buildroot] [PATCH 5/6] package/genpart: new host-only package
In-Reply-To: <20130310124409.1a4d33a8@skate>
References: <cover.1362693294.git.yann.morin.1998@free.fr>
 <bfe10d7db2c24538af439516e719f4e1c98eba5b.1362693294.git.yann.morin.1998@free.fr>
 <20130310124409.1a4d33a8@skate>
Message-ID: <201303110050.51939.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 10 March 2013 Thomas Petazzoni wrote:
> On Thu,  7 Mar 2013 22:55:30 +0100, Yann E. MORIN wrote:
> 
> > --- /dev/null
> > +++ b/package/genpart/genpart.mk
> > @@ -0,0 +1,11 @@
> > +#############################################################
> > +#
> > +# genpart
> > +#
> > +#############################################################
> > +
> > +GENPART_VERSION       = 1.0.2
> > +GENPART_SOURCE        = genpart-$(GENPART_VERSION).tar.bz2
> > +GENPART_SITE          = http://www.pengutronix.de/software/genpart/download/
> 
> There's no license at all mentioned in the source code. It's true the
> code is pretty trivial, but anyway. Maybe you could add:
> 
> GENPART_LICENSE = Currently being decided by authors
> 
> And contact the Pengutronix people to get your patches merged and ask
> them to put a proper license in there.

Path has already been accepted upstream, but they said they will probably
never ever make another release of genpart, which in their opinion has
been superseded by genimage.

I'll make sure to contact them to clarify the license.

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

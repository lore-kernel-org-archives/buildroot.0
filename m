From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jan 2014 23:23:46 +0100
Subject: [Buildroot] [PATCH 03/14] libass: new package
In-Reply-To: <20140114221725.GC3328@free.fr>
References: <1389549208-19078-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1389549208-19078-4-git-send-email-maxime.hadjinlian@gmail.com>
 <20140114221725.GC3328@free.fr>
Message-ID: <20140114222346.GD3328@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-01-14 23:17 +0100, Yann E. MORIN spake thusly:
> On 2014-01-12 18:53 +0100, Maxime Hadjinlian spake thusly:
> > libass is a portable subtitle renderer for the
> > ASS/SSA (Advanced Substation Alpha/Substation Alpha) subtitle format.
> > This package was originally found at : https://github.com/huceke/buildroot-rbp
> > By gimli <ebsi4711@gmail.com>
> > 
> > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> [--SNIP--]
> > diff --git a/package/libass/libass.mk b/package/libass/libass.mk
> > new file mode 100644
> > index 0000000..3fd748a
> > --- /dev/null
> > +++ b/package/libass/libass.mk
> > @@ -0,0 +1,14 @@
> > +#############################################################
> 
> 80-chars, please.
> 
> > +#
> > +# libass
> > +#
> > +#############################################################
> 
> Ditto.

Otherwise:
    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2019 12:07:16 +0100
Subject: [Buildroot] [PATCH] package/open2300: add hash file
In-Reply-To: <CAEyMn7an_j9Uwh-6SKSz6R6ekDMkH4QJavexEeEWGQGW=tEx5w@mail.gmail.com>
References: <20191222083707.3448-1-heiko.thiery@gmail.com>
 <20191222105754.188b7bd2@windsurf>
 <CAEyMn7an_j9Uwh-6SKSz6R6ekDMkH4QJavexEeEWGQGW=tEx5w@mail.gmail.com>
Message-ID: <20191222110716.GB26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2019-12-22 12:00 +0100, Heiko Thiery spake thusly:
> Am So., 22. Dez. 2019 um 10:57 Uhr schrieb Thomas Petazzoni
> <thomas.petazzoni@bootlin.com>:
> > On Sun, 22 Dec 2019 09:37:08 +0100
> > Heiko Thiery <heiko.thiery@gmail.com> wrote:
> > > - add sha256 tarball hash
> > > - add sha256 license hash
> > We need a comment at the top of the file that says where the hashes come from.
> is a simple "# Locally generated" ok?

Yes, that's all that is needed. If you got the value from elsewhere,
that would need to eb said as well (e.g. in the mailing list archive for
the announcement mail, for example...)

> I will update the patch.

No need to respin, it can be done manualy when applying.

Regards,
Yann E. MORIN.

> > > +sha256       f4239d2f16d52156586d06be38f06a3eb58168377e243a8de8720b66e33ddb8f  open2300-12.tar.gz
> >
> > The source code for this package is fetched from Subversion. Are the
> > tarballs we create out of SVN repositories reproducible ? I guess so,
> > but let's loop in Yann Morin for some additional feedback on this.
> >
> > Thanks,
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

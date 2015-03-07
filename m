From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Mar 2015 16:50:50 +0100
Subject: [Buildroot] [PATCH 3/3] uclibc: add patch fixing non-threaded
 build on Xtensa for uClibc-ng 1.0.0
In-Reply-To: <20150307154325.GH3937@waldemar-brodkorb.de>
References: <1425735600-16762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425735600-16762-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150307144013.GE4186@free.fr>
 <20150307154325.GH3937@waldemar-brodkorb.de>
Message-ID: <20150307155050.GG4186@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2015-03-07 16:43 +0100, Waldemar Brodkorb spake thusly:
> Yann E. MORIN wrote,
> > On 2015-03-07 14:40 +0100, Thomas Petazzoni spake thusly:
> > > Backported from upstream, will be part of the next release of
> > > uClibc-ng.
> > > 
> > > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > > ---
> > >  .../0002-fix-non-thread-compile-for-xtensa.patch   | 49 ++++++++++++++++++++++
> > 
> > I know this is not the first patch we have against uClibc-ng, but what
> > will happen when uClibc eventually tags 1.0.0? How will we differentiate
> > the patch directories between uClibc-1.0.0 and uClibc-ng 1.0.0 ?
> 
> May be then we get an extra package for uClibc-ng?

Well, uClibc-ng is still too similar to uClibc to warrant a different
package. That's the whole point Thomas argued for in the previous
attempts at adding uClibc-ng.

We could make the version string something like "ng-1.0.0"... That's a
bit of a hack, however.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

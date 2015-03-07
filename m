From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 7 Mar 2015 16:43:26 +0100
Subject: [Buildroot] [PATCH 3/3] uclibc: add patch fixing non-threaded
 build on Xtensa for uClibc-ng 1.0.0
In-Reply-To: <20150307144013.GE4186@free.fr>
References: <1425735600-16762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425735600-16762-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150307144013.GE4186@free.fr>
Message-ID: <20150307154325.GH3937@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,
Yann E. MORIN wrote,

> Thomas, All,
> 
> On 2015-03-07 14:40 +0100, Thomas Petazzoni spake thusly:
> > Backported from upstream, will be part of the next release of
> > uClibc-ng.
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  .../0002-fix-non-thread-compile-for-xtensa.patch   | 49 ++++++++++++++++++++++
> 
> I know this is not the first patch we have against uClibc-ng, but what
> will happen when uClibc eventually tags 1.0.0? How will we differentiate
> the patch directories between uClibc-1.0.0 and uClibc-ng 1.0.0 ?

May be then we get an extra package for uClibc-ng?
Bernhard is planning 0.9.34 release, so it is more a theoretically
problem. I am sure uClibc-ng 1.1 is out before uClibc tags 1.0.0.

best regards
 Waldemar
 

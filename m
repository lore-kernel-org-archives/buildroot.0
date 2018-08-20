From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 20 Aug 2018 05:41:43 -0700
Subject: [Buildroot] [PATCH 04/18] perl-time-parsedate: new package
In-Reply-To: <20180820142755.17fdb6b5@windsurf>
References: <20180820115519.24046-1-chrismcc@gmail.com>
 <20180820115519.24046-5-chrismcc@gmail.com>
 <20180820135930.67c124db@windsurf>
 <CALURroRXJRkT3agrhjCniDUV608M06Tm+n_7ssFL=w2FiWpytg@mail.gmail.com>
 <20180820142755.17fdb6b5@windsurf>
Message-ID: <CALURroQsU0NNQQyyH=O0+MJPXwCrDistn1Hzup-EvH4YndBSMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 20, 2018 at 5:27 AM, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Mon, 20 Aug 2018 05:12:22 -0700, Christopher McCrory wrote:
>
> > It looks like I missed putting this in the cover leter
> > 0013-perl-time-parsedate-add-license.patch has
> >
> >
> > -PERL_TIME_PARSEDATE_LICENSE = unknown
> > +# https://fedoraproject.org/wiki/Licensing/TPDL
> > +PERL_TIME_PARSEDATE_LICENSE = Public Domain
>
> Why is this change part of a separate patch ? It should be inside the
> patch adding the perl-time-parsedate package.
>

I wasn't sure what would be best.  It allows a followup patch to do the
right thing.



>
> Also, the license is not public domain. Fedora calls it TPDL, which
> stands for Time Parse Date License.
>
>
https://src.fedoraproject.org/rpms/perl-Time-ParseDate/blob/master/f/perl-Time-ParseDate.spec

Summary:        Perl modules for parsing dates and times
# See https://fedoraproject.org/wiki/Licensing/TPDL
License:        TPDL and Public Domain
URL:            https://metacpan.org/release/Time-ParseDate


Arg, that should have also been in the cover letter,  Somehow I missed it
during copy and paste.


Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>



-- 
Christopher McCrory
To the optimist, the glass is half full.
To the pessimist, the glass is half empty.
To the engineer, the glass is twice as big as it needs to be.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180820/3585bf7f/attachment.html>

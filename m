From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 14:27:55 +0200
Subject: [Buildroot] [PATCH 04/18] perl-time-parsedate: new package
In-Reply-To: <CALURroRXJRkT3agrhjCniDUV608M06Tm+n_7ssFL=w2FiWpytg@mail.gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
 <20180820115519.24046-5-chrismcc@gmail.com>
 <20180820135930.67c124db@windsurf>
 <CALURroRXJRkT3agrhjCniDUV608M06Tm+n_7ssFL=w2FiWpytg@mail.gmail.com>
Message-ID: <20180820142755.17fdb6b5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 05:12:22 -0700, Christopher McCrory wrote:

> It looks like I missed putting this in the cover leter
> 0013-perl-time-parsedate-add-license.patch has
> 
> 
> -PERL_TIME_PARSEDATE_LICENSE = unknown
> +# https://fedoraproject.org/wiki/Licensing/TPDL
> +PERL_TIME_PARSEDATE_LICENSE = Public Domain

Why is this change part of a separate patch ? It should be inside the
patch adding the perl-time-parsedate package.

Also, the license is not public domain. Fedora calls it TPDL, which
stands for Time Parse Date License.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Jun 2014 21:41:45 +0200
Subject: [Buildroot] [PATCH 10/21] package/snappy: bump version
In-Reply-To: <87d2erw2d9.fsf@dell.be.48ers.dk>
References: <cover.1401658972.git.yann.morin.1998@free.fr>
 <baf017295cfab2600216c057e3a75a25a2b7f8c1.1401658972.git.yann.morin.1998@free.fr>
 <87d2erw2d9.fsf@dell.be.48ers.dk>
Message-ID: <20140602194145.GC3404@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Al,

On 2014-06-02 21:14 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > This is the un-tagged 1.1.2 release.
> 
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > ---
>  >  package/snappy/snappy.mk | 4 ++--
>  >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
>  > diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
>  > index c30cb3c..6d20df8 100644
>  > --- a/package/snappy/snappy.mk
>  > +++ b/package/snappy/snappy.mk
>  > @@ -4,8 +4,8 @@
>  >  #
>  >  ################################################################################
>  
>  > -SNAPPY_VERSION = 1.1.1
>  > -SNAPPY_SITE = http://snappy.googlecode.com/files/
>  > +SNAPPY_VERSION = 1ff9be9b8fafc8528ca9e055646f5932aa5db9c4
>  > +SNAPPY_SITE = $(call github,google,snappy,$(SNAPPY_VERSION))
> 
> Seems like it is missing an AUTORECONF:
> 
> http://autobuild.buildroot.net/results/0ec/0ec62efed0e0aec56b4aa6b5ef1a3bcbd1474949/build-end.log

Sigh... So sorry... :-(

I had it autoreconfed manually, and forgot to remove the build-dir for
subsequent builds... :-(

> Will fix now.

Thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

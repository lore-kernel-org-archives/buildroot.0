From: =?UTF-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>
Date: Wed, 18 Mar 2020 09:17:18 +0100
Subject: [Buildroot] [PATCH] package/ed: Bump to version 1.16
In-Reply-To: <20200317215121.GX19677@scaer>
References: <20200310081637.3288-1-kevin.lhopital@bootlin.com>
 <20200317215121.GX19677@scaer>
Message-ID: <20200318091718.0578abfb@lhopital-XPS-13-9360>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 17 Mar 2020 22:51:21 +0100,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

Hello,


> K?vin, All,
> 
> On 2020-03-10 09:16 +0100, K?vin L'h?pital spake thusly:
> > Signed-off-by: K?vin L'h?pital <kevin.lhopital@bootlin.com>  
> 
> Thanks for this patch. However I have a very minor comment, see
> below...
> 
> > ---
> >  package/ed/ed.hash | 4 ++--
> >  package/ed/ed.mk   | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/package/ed/ed.hash b/package/ed/ed.hash
> > index 96c814d3c2..2544676b06 100644
> > --- a/package/ed/ed.hash
> > +++ b/package/ed/ed.hash
> > @@ -1,4 +1,4 @@
> > -# From
> > http://lists.gnu.org/archive/html/bug-ed/2019-01/msg00010.html
> > -sha256
> > ad4489c0ad7a108c514262da28e6c2a426946fb408a3977ef1ed34308bdfd174
> > ed-1.15.tar.lz +# From
> > https://lists.gnu.org/archive/html/bug-ed/2020-02/msg00002.html
> > +sha256
> > cfc07a14ab048a758473ce222e784fbf031485bcd54a76f74acfee1f390d8b2c
> > ed-1.16.tar.lz  
> 
> We're now trying to converge all our hash files to a common coding
> style, which is using two spaces btween fields:
>     sha256
> cfc07a14ab048a758473ce222e784fbf031485bcd54a76f74acfee1f390d8b2c
> ed-1.16.tar.lz
> 
> >  # Locally calculated
> >  sha256
> > f03a12bef9dfb7281864a0dd965166d4f4ec7a66633df2bc72fa4363e57de02c
> > COPYING  
> 
> Ditto for the hashes for license files.
> 
> Care to fix and respin, please?
> 

Thanks for the review, I will fix this.


> (Usually, I'd have fixed while applying, but I have understood that
> it's part of your baptism of fire, so... ;-] ).
> 

Aha, all right, no problem ;-)

Best regards,
L'h?pital K?vin
-- 
Kevin L'Hopital, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

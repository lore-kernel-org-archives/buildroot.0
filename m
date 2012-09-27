From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 27 Sep 2012 21:30:21 +0200
Subject: [Buildroot] [PATCH v3] external-toolchain:
 BR2_TOOLCHAIN_EXTERNAL_GLIBC includes eglibc
In-Reply-To: <201209272120.01265.yann.morin.1998@free.fr>
References: <1348773014-19000-1-git-send-email-baruch@tkos.co.il>
 <201209272120.01265.yann.morin.1998@free.fr>
Message-ID: <20120927193010.GA4877@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Thu, Sep 27, 2012 at 09:20:01PM +0200, Yann E. MORIN wrote:
> On Thursday 27 September 2012 21:10:14 Baruch Siach wrote:
> > Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> > v3: rephrase the help text to make it clear that the eglibc build is given,
> >     address the comment of Thomas Petazzoni.
> [--SNIP--]
> >  config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
> > -	bool "glibc"
> > +	bool "glibc/eglibc"
> >  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> > +	help
> > +	  Note: eglibc is a variant of glibc that (among other things) can be
> > +	  configured to exclude parts of its features. This capability is 
> > +	  currently not supported.
> 
> Yes, that is very good!

Sorry, this is actually v2. I've just sent v4 with the corrected text 
addressing (I hope) Thomas' comment.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

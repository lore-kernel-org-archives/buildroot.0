From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 25 Sep 2012 10:33:30 +0200
Subject: [Buildroot] [PATCH] external-toolchain:
 BR2_TOOLCHAIN_EXTERNAL_GLIBC includes eglibc
In-Reply-To: <20120925095442.01c07b54@skate>
References: <1348544993-5682-1-git-send-email-baruch@tkos.co.il>
 <20120925095442.01c07b54@skate>
Message-ID: <20120925083330.GD4439@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Sep 25, 2012 at 09:54:42AM +0200, Thomas Petazzoni wrote:
> Dear Baruch Siach,
> 
> On Tue, 25 Sep 2012 05:49:53 +0200, Baruch Siach wrote:
> 
> > +	  Note: eglibc is a variant of glibc that (among other things) can be
> > +	  configured to exclude parts of its features. This capability is 
> > +	  currently not supported.
> 
> This note makes no sense in the context of external toolchains: the C
> library is already compiled into the external toolchain, so it's the
> responsibility of the person building the external toolchain to know
> how to configure eglibc. The fact that we don't support eglibc
> configuration in Buildroot doesn't make much sense.
> 
> Or, if you want to mean that we don't support eglibc toolchains that
> have been configured to leave out certain features (such as IPv6
> support for example), then it should be said in a different way, such
> as: "We only support eglibc toolchains providing this, that and this
> other feature".

This is exactly what I meant to say, but the text surely needs to be clearer 
as you suggest. What feature do you think we need to mention as minimal 
requirements in the help text?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

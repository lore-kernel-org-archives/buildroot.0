From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 23 May 2013 10:09:18 +0300
Subject: [Buildroot] [PATCH 4/5] portaudio: add license information
In-Reply-To: <20130523065904.GD3373@free.fr>
References: <1369268647-13128-1-git-send-email-gilles.talis@gmail.com>
 <1369268647-13128-4-git-send-email-gilles.talis@gmail.com>
 <20130523065904.GD3373@free.fr>
Message-ID: <20130523070918.GG25186@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Thu, May 23, 2013 at 08:59:04AM +0200, Yann E. MORIN wrote:
> On 2013-05-22 17:24 -0700, Gilles Talis spake thusly:
> > Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> > ---
> >  package/portaudio/portaudio.mk |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> > 
> > diff --git a/package/portaudio/portaudio.mk b/package/portaudio/portaudio.mk
> > index 34b0bd9..917702e 100644
> > --- a/package/portaudio/portaudio.mk
> > +++ b/package/portaudio/portaudio.mk
> > @@ -9,6 +9,8 @@ PORTAUDIO_SITE = http://www.portaudio.com/archives
> >  PORTAUDIO_SOURCE = pa_stable_$(PORTAUDIO_VERSION).tgz
> >  PORTAUDIO_INSTALL_STAGING = YES
> >  PORTAUDIO_MAKE = $(MAKE1)
> > +PORTAUDIO_LICENSE = MIT
> 
> This is not really MIT, since there is additional text:
> 
>  ---8<---
>  * The text above constitutes the entire PortAudio license; however, 
>  * the PortAudio community also makes the following non-binding
>  * requests:
>  *
>  * Any person wishing to distribute modifications to the Software is
>  * requested to send the modifications to the original developer so that
>  * they can be incorporated into the canonical version. It is also 
>  * requested that these non-binding requests be included along with the 
>  * license above.
>  ---8<---
> 
> So I'd say:
>     PORTAUDIO_LICENSE = portaudio license (MIT-like plus special clause)
> 
> (which by the way makes it non-free software.)

Well, the text you cite says explicitly that these are "non-binding requests".  
Would you still consider this non-free?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

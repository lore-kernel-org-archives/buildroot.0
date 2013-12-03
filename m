From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Dec 2013 09:59:20 +0100
Subject: [Buildroot] [PATCH 1/5] coreutils: belongs to system tools,
 not development
In-Reply-To: <87zjoipdlk.fsf@dell.be.48ers.dk>
References: <1385981368-2235-1-git-send-email-gustavo@zacarias.com.ar>
 <87zjoipdlk.fsf@dell.be.48ers.dk>
Message-ID: <20131203095920.1e46375f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 03 Dec 2013 09:01:43 +0100, Peter Korsgaard wrote:
> >>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:
> 
>  > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>  > ---
>  >  package/Config.in | 4 +---
>  >  1 file changed, 1 insertion(+), 3 deletions(-)
> 
>  > diff --git a/package/Config.in b/package/Config.in
>  > index e2ca8ee..a65ceac 100644
>  > --- a/package/Config.in
>  > +++ b/package/Config.in
>  > @@ -86,9 +86,6 @@ source "package/bison/Config.in"
>  >  source "package/bsdiff/Config.in"
>  >  source "package/bustle/Config.in"
>  >  source "package/ccache/Config.in"
>  > -if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  > -source "package/coreutils/Config.in"
>  > -endif
> 
> Committed, thanks.
> 
> I'm really starting to think we should get rid of
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, or atleast make it default y.
> 
> Comments, anybody?

We've always said that it was important to keep this option so that
newcomers don't enable things like coreutils, bash and so on, and use
what I'd consider the default "Buildroot experience", i.e Busybox.

What made you change your mind about this?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

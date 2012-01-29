From: Michael S. Zick <minimod@morethan.org>
Date: Sun, 29 Jan 2012 09:50:25 -0600
Subject: [Buildroot] [RFC 14/15] foobar: create a fake proprietary
	package (testing only)
In-Reply-To: <CALR4fELbaToSJw6qJHWJ=hF8TBA4gMsN49eTaiESt+PJRytoUA@mail.gmail.com>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
 <1327849908-15588-15-git-send-email-luca@lucaceresoli.net>
 <CALR4fELbaToSJw6qJHWJ=hF8TBA4gMsN49eTaiESt+PJRytoUA@mail.gmail.com>
Message-ID: <201201290950.27997.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun January 29 2012, Diego Iastrubni wrote:
> On Sun, Jan 29, 2012 at 5:11 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> >
> > This is only for testing the proprietary package handling, not to be
> > committed in any serious repository.
> >
> > +FOOBAR_LICENSE = PROPRIETARY
> >
> > +++ b/package/foobar/source/foobar.c
> > @@ -0,0 +1,7 @@
> > +#include <stdlib.h>
> > +
> > +int main(void)
> > +{
> > + ?printf("Hello, World!\n");
> > + ?return 0;
> > +}
> 
> 
> <sarcasm>
> OMG OMG... buildroot is forking into a?proprietary?applications DB...
> where is ./ where we need them?
> </sarcasm>
> 

Perhaps you missed the recently added support for closed source
binary firmware blobs?

<sarcasm>
Your panic threshold setting may have to be tweaked up a bit.
</sarcasm>

If this proposal or something like it is included in the build
system, then those firmware blob licenses could also be handled
with the new bit of infrastructure.

Mike
> /me takes a cup of water and relaxes... ;-)
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 

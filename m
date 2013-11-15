From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 15 Nov 2013 21:37:19 +0100
Subject: [Buildroot] [PATCH 6/6] Makefile: export PATH
In-Reply-To: <20131111233113.2e11fd88@skate>
References: <1384203586-17790-1-git-send-email-s.martin49@gmail.com>
 <1384203586-17790-7-git-send-email-s.martin49@gmail.com>
 <20131111233113.2e11fd88@skate>
Message-ID: <CAHXCMMJnox5o3hfiVgj2vzK=1=pbm85cF+9Jutth-4LRvLB5CA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,


2013/11/11 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Dear Samuel Martin,
>
> On Mon, 11 Nov 2013 21:59:46 +0100, Samuel Martin wrote:
> > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> > ---
> >  Makefile | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Makefile b/Makefile
> > index 4010c65..d587b4f 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -294,6 +294,7 @@ export STAGING_DIR
> >  export HOST_DIR
> >  export BINARIES_DIR
> >  export BASE_DIR
> > +export PATH:=$(BR2_PATH)
>
> Why?
>

To me, this could make easier writing post-{build,image} scripts.
But, as I said in the cover letter, I'm dubious about this patch.

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131115/350b7808/attachment.html>

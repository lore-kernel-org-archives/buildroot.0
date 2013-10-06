From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 6 Oct 2013 20:21:14 +0200
Subject: [Buildroot] [PATCH 3/9] manual: update dependency list to build
 the documentation
In-Reply-To: <CAAXf6LWddtoi8X5B8BW0dM+Q+BQDtVimarw4qQm8m_eSZLVqUw@mail.gmail.com>
References: <cover.1381002281.git.s.martin49@gmail.com>
 <b03af600c8b5b0cfd0de60397918367cc3aeeaec.1381002281.git.s.martin49@gmail.com>
 <CAAXf6LWddtoi8X5B8BW0dM+Q+BQDtVimarw4qQm8m_eSZLVqUw@mail.gmail.com>
Message-ID: <CAHXCMM+T-eiyS2V4YmB-OQpg1L-ViU5TL8baMn8-RtqOQ88gbg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/10/6 Thomas De Schampheleire <patrickdepinguin@gmail.com>

> On Sat, Oct 5, 2013 at 9:49 PM, Samuel Martin <s.martin49@gmail.com>
> wrote:
> > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> > ---
> >  docs/manual/prerequisite.txt | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
> > index 78ce436..74b6a6c 100644
> > --- a/docs/manual/prerequisite.txt
> > +++ b/docs/manual/prerequisite.txt
> > @@ -76,4 +76,7 @@ development context (further details: refer to
> xref:download-infra[]).
> >  ** The +jar+ tool
> >
> >  * Documentation generation tools:
> > -** +asciidoc+
> > +** +asciidoc+ version 8.6.3 or later
> > +** +dblatex+
> > +** +w3m+
> > +** +python+ with +argparse+ module
> > --
> > 1.8.4
>
> This change is already part of my patch:
> http://patchwork.ozlabs.org/patch/276855/
> The patch is not yet committed though, but is in the to-be-applied
> overview ThomasP sent today...
>
Well, and I did acked it, so forget this patch.

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131006/53dd171a/attachment.html>

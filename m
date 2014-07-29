From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 29 Jul 2014 18:50:52 +0200
Subject: [Buildroot] [PATCH] add sob line for patch series
In-Reply-To: <20140729184532.40a961ab@free-electrons.com>
References: <20140729150130.GA25263@waldemar-brodkorb.de>
 <20140729184532.40a961ab@free-electrons.com>
Message-ID: <20140729165051.GC32743@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Dear Waldemar Brodkorb,
> 
> On Tue, 29 Jul 2014 17:01:30 +0200, Waldemar Brodkorb wrote:
> > I think -s is missing here to automatically add
> > the sob line, when using this example.
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > ---
> >  docs/manual/contribute.txt |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> > index 12e7f98..b7e8944 100644
> > --- a/docs/manual/contribute.txt
> > +++ b/docs/manual/contribute.txt
> > @@ -272,7 +272,7 @@ This can be easily handled with +git format-patch+ by using the option
> >  
> >  ---------------------
> >  $ git format-patch --subject-prefix "PATCH v4" \
> > -    -M -o outgoing origin/master
> > +    -M -s -o outgoing origin/master
> >  ---------------------
> 
> I think the best practice should rather be to SoB when committing (i.e
> 'git commit -s') rather than when formatting patches, no?

The example above in the manual is using -s for format-patch.
I didn't even know that I can use -s while doing commit ;)

best regards
 Waldemar

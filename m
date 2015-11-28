From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Nov 2015 16:46:19 +0100
Subject: [Buildroot] [git commit] docs/website: fix invalid link
In-Reply-To: <20151128135415.4FA0681DAF@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 28 Nov 2015 14:54:07 +0100")
References: <20151128135415.4FA0681DAF@busybox.osuosl.org>
Message-ID: <874mg6qg8k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: http://git.buildroot.net/buildroot/commit/?id=15cec18f6c3aa5b1e8d6b9d39fe48f4ccc4c8eeb
 > branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  docs/website/news.html |    2 +-
 >  1 files changed, 1 insertions(+), 1 deletions(-)

 > diff --git a/docs/website/news.html b/docs/website/news.html
 > index eb4ec6c..405a9e2 100644
 > --- a/docs/website/news.html
 > +++ b/docs/website/news.html
 > @@ -25,7 +25,7 @@
 >  	  pick up
 >  	  the <a href="/downloads/buildroot-2015.11-rc3.tar.bz2">2015.11-rc3
 >  	    release candidate</a>, and report any problems found to
 > -	  the <a href="lists.html">mailing list</a>
 > +	  the <a href="support.html">mailing list</a>

Thanks, but please also fix all the other references to lists.html while
you're at it:

git grep lists.html
docs/website/news.html:   the <a href="lists.html">mailing list</a>
docs/website/news.html:   the <a href="lists.html">mailing list</a>
docs/website/news.html:   the <a href="lists.html">mailing list</a>
docs/website/news.html:   the <a href="lists.html">mailing list</a>
docs/website/news.html:   the <a href="lists.html">mailing list</a>
docs/website/news.html:   the <a href="lists.html">mailing list</a>
docs/website/news.html:   the <a href="lists.html">mailing list</a>

lists.html appprently got removed when we added the previous (Maxime's)
website.

-- 
Bye, Peter Korsgaard

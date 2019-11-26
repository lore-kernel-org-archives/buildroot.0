From: Mark Corbin <mark@dibsco.co.uk>
Date: Tue, 26 Nov 2019 20:32:29 +0000
Subject: [Buildroot] [PATCH 1/1] package/fis: add an upstream URL to
 Config.in
In-Reply-To: <20191126210534.168608da@windsurf>
References: <20191126144341.27186-1-mark@dibsco.co.uk>
 <20191126210534.168608da@windsurf>
Message-ID: <1835699.hYYKYNglDJ@laptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas

On Tuesday, 26 November 2019 20:05:34 GMT Thomas Petazzoni wrote:
> On Tue, 26 Nov 2019 14:43:41 +0000
> 
> Mark Corbin <mark@dibsco.co.uk> wrote:
> > Add an upstream URL to the help text in Config.in. This
> > addresses the 'Missing' URL status in the package stats
> > web page output.
> > 
> > Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
> > ---
> > 
> >  package/fis/Config.in | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/package/fis/Config.in b/package/fis/Config.in
> > index c5bfbb82cc..1c6be02978 100644
> > --- a/package/fis/Config.in
> > +++ b/package/fis/Config.in
> > @@ -2,3 +2,5 @@ config BR2_PACKAGE_FIS
> > 
> >  	bool "fis"
> >  	help
> >  	
> >  	  fis - manipulate RedBoot partition table from Linux.
> > 
> > +
> > +	  https://svn.chezphil.org/utils/trunk/
> 
> Just pointing to the source code itself is not that useful. 

At this stage I'm really just trying to clean up some of the noise on the 
package stats page -  http://autobuild.buildroot.org/stats/

I'm quite happy for you to decide whether the links are useful/appropriate.

Regards

Mark

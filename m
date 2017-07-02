From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Sun, 2 Jul 2017 14:26:25 +0200
Subject: [Buildroot] [PATCH 1/1] utils/readme.txt: fix typos for
	size-stats-compare
In-Reply-To: <20170701182129.GE3593@scaer>
References: <20170701180027.GY29444@argentina>
 <20170701182129.GE3593@scaer>
Message-ID: <20170702122625.GZ29444@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 01, 2017 at 08:21:29PM +0200, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2017-07-01 20:00 +0200, Thomas De Schampheleire spake thusly:
> > A few typos sneaked into the new utils readme...
> 
> Yup, sorry...
> 
> > Additionally, I formulated the list of use cases a bit differently.
> > 
> > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> > ---
> >  utils/readme.txt | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/utils/readme.txt b/utils/readme.txt
> > index a90805fb0..fd20e8ee6 100644
> > --- a/utils/readme.txt
> > +++ b/utils/readme.txt
> > @@ -28,10 +28,10 @@ scanpypi
> >      a script to create a Buildroot package by scanning a PyPI package
> >      description.
> >  
> > -size-stat-compare
> > -    a script to compare the rootfs size between two differnt Buildroot
> > +size-stats-compare
> > +    a script to compare the rootfs size between two different Buildroot
> >      configurations. This can be used to identify the size impact of
> > -    a specific option, or of a set of specific options, or an update
> > +    a specific option, of a set of specific options, or of an update
> 
> I still believe the current situation is prefereable, because it is :
> 
> the impact of
>     - a specific option, or of a set of options,
>   or
>     - a new buildroot version
> 
> (use of the Oxford comma is very important, here! ;-] )

Just to make sure we settle this ;-)
The way I see it, the expanded version would be:

... the impact of a specific option, the impact of a set of options, or the
impact of a new buildroot version.

which I would shorten to either of:

... the impact of a specific option, a set of options, or a new buildroot
version.

... the impact of a specific option or set of options, or of a new buildroot
version.

and perhaps other variants, but I feel that _if_ you repeat 'of' in the 'of a
set of options' part, then you must also repeat it in the 'new buildroot
version' part.

Anyway, who reads these readme's anyway? ;-)

/Thomas

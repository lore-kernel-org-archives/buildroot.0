From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 16 May 2014 23:33:14 +0200
Subject: [Buildroot] [PATCH 5/8] graph-depends: document the max_depth
	variable
In-Reply-To: <20140516232641.201c1825@free-electrons.com>
References: <cover.1400273945.git.yann.morin.1998@free.fr>
 <77ef0e4acd2da331895bf92aa03593bb284dbe62.1400273945.git.yann.morin.1998@free.fr>
 <20140516232641.201c1825@free-electrons.com>
Message-ID: <20140516213314.GE3466@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-05-16 23:26 +0200, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Fri, 16 May 2014 23:05:17 +0200, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > Although unnecessary (we already have initialisation via the parser),
> > initialise the max_depth option, and document it at the same time.
> 
> This description...
> 
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> > Cc: Samuel Martin <s.martin49@gmail.com>
> > ---
> >  support/scripts/graph-depends | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
> > index c3dcbf1..dc6b98f 100755
> > --- a/support/scripts/graph-depends
> > +++ b/support/scripts/graph-depends
> > @@ -37,6 +37,9 @@ mode = 0
> >  # Limit drawing the dependency graph to this depth. 0 means 'no limit'.
> >  max_depth = 0
> >  
> > +# Whether to draw the transitive dependencies
> > +transitive = True
> > +
> 
> doesn't seem to match what the patch is doing. Am I missing something?

You are missing nothing. I am missing some sleep, a new pair of eyes,
and a brain. ;-)

The code is correct, and the commit log should be:
    s/max_depth/transitive/

Thanks for spotting! :-)

I will respin after the dust has settled, to let other time to review.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

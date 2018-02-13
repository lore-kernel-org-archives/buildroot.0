From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 23:19:30 +0100
Subject: [Buildroot] patchwork.ozlabs.org down, and e-mails not recorded
In-Reply-To: <981ecf77-767e-3c90-243f-67251d956c21@au1.ibm.com>
References: <20180105214340.6f0cc1f7@windsurf>
 <ced2aeb2-82f6-c836-dd5a-e65c6b49c81a@au1.ibm.com>
 <20180108091044.1141f540@windsurf>
 <20180205224500.1a34e02a@windsurf>
 <981ecf77-767e-3c90-243f-67251d956c21@au1.ibm.com>
Message-ID: <20180213231930.26ab0efb@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, Jeremy,

On Tue, 6 Feb 2018 19:41:09 +1100, Andrew Donnellan wrote:
> On 06/02/18 08:45, Thomas Petazzoni wrote:
> > Is there anything that can be done about this ? An example of
> > Message-Id that was not recorded is:
> > 
> >   Message-Id: <8027bae45d8e041c8a1e0bc714ab378ff984ded3.1517820133.git.yann.morin.1998@free.fr>  
> 
> I've scraped the buildroot archives to see if there's anything obviously 
> wrong with that particular message ID - it appears to parse fine.
> 
> jk, any idea whether there's something particular about the ozlabs.org 
> instance that could be causing it to drop these patches?

Any further comments ?

Today, patchwork missed the following e-mail:

  http://lists.busybox.net/pipermail/buildroot/2018-February/213695.html

Patches 1/3 and 2/3 in this series have been recorded, but not Patch
3/3.

This is really getting annoying for the Buildroot project, and we may
potentially "miss" contributions because of this: we entirely rely on
patchwork as our TODO-list, so if a patch is missing in patchwork, we
will forget about it. When only a few patches within a series are
missing, we obviously notice. But for single patches, when they are not
recorded, we simply miss them entirely.

Can we do something about this ? We're really happy otherwise by the
patchwork instance at ozlabs.org, and we would hate having to run our
own instance :-/

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

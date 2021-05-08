From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 May 2021 20:21:48 +0200
Subject: [Buildroot] [PATCH v3 5/7] boot/beaglev-ddrinit: new package
In-Reply-To: <20210507220401.GE2137340@scaer>
References: <20210504205139.1055360-1-thomas.petazzoni@bootlin.com>
 <20210504205139.1055360-6-thomas.petazzoni@bootlin.com>
 <20210507220401.GE2137340@scaer>
Message-ID: <20210508202148.1a348232@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 8 May 2021 00:04:01 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> On 2021-05-04 22:51 +0200, Thomas Petazzoni spake thusly:
> > This commit adds a package for the DDR initialization code used on the
> > BeagleV platform.  
> 
> The upstream package name is beaglev-ddrlnit, yes, with an 'l' instead
> of an 'i'. I've renamed the package to match upstream name, so that
> users that look for it can actually find it.

Ah, in fact I had only seen the package name on github with a font
where the l and I are pretty much the same, so I thought it was named
ddrInit (with a capital 'I') and I normalized that to 'ddrinit' was we
like lower-case name in Buildroot packages.

But indeed, I see that the repository is named ddrlnit. I'm wondering
if this isn't just a mistake, because then everywhere it is referred to
as ddrinit. ddrlnit doesn't make much sense to me.

But fair enough, for now it's named beaglev-ddrlnit so our Buildroot
package should follow that naming.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

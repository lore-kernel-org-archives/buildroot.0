From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Sep 2019 21:53:29 +0200
Subject: [Buildroot] [External] Re:  [PATCH] package/bc: bump to 1.07.1
In-Reply-To: <CANQCQpZx4m6Jdu4UnQqnX4YZW0qktZ+sQDVfRY5w9QhopVCv1Q@mail.gmail.com>
References: <20190912205057.40777-1-matthew.weber@rockwellcollins.com>
 <20190913194622.303b5a31@windsurf.home>
 <CANQCQpY_HqqxoUkAOcxN0_ORRnYLTdUdfBXC=5ZfShXOWCDeCg@mail.gmail.com>
 <20190913203145.2e05eb85@windsurf.home>
 <20190913203422.3182c077@windsurf.home>
 <CANQCQpZx4m6Jdu4UnQqnX4YZW0qktZ+sQDVfRY5w9QhopVCv1Q@mail.gmail.com>
Message-ID: <20190913215329.53db65b4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 Sep 2019 13:40:00 -0500
Matthew Weber <matthew.weber@collins.com> wrote:

> Ah ok, so it looks like your discussion was around 1.07.1.   Should I
> maybe give it another try with our current set of patches that are
> aligned with Debian?
> 
> I noticed your email was with respect to the libmath.h generation
> issues, were you just pointing those out to the maintainer or was
> there a better patch then the removal changes Yocto proposed?

I think it was the Yocto change that was proposed:

====
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Phil Nelson <philnelson@acm.org>
Cc: Jose Lamego <jose.a.lamego@linux.intel.com>, Vincent.Riera at imgtec.com,  ken at gnu.org
Subject: Re: Please provide feedback: bc 1.07+ not building with Yocto  project tools (libmath.h related)
Date: Wed, 23 Aug 2017 15:18:10 +0200
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
Organization: Free Electrons

Hello,

On Tue, 18 Jul 2017 22:24:07 -0700, Phil Nelson wrote:
> On Tuesday 18 July 2017 10:06:09 Jose Lamego wrote:  
> > Hi Phil,
> > 
> > I just learned that Vincent, Thomas and others (cc'ed) have found the
> > same issues as the Yocto team when trying to update bc recipe.    
> 
> How does that attached version work?  

This version works fine in the context of Buildroot, i.e it does not
have additional dependencies that are annoying to provide.

When do you think you could release this updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
===

I have uploaded at https://bootlin.com/~thomas/bc-1.07.2.tar.gz the
tarball that the maintainer gave me back then as a preview for 1.07.2
which was apparently never released.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

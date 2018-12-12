From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 12 Dec 2018 10:34:33 +0100
Subject: [Buildroot] [PATCH] package/liquid-dsp: add missing dependency
 on fftw
In-Reply-To: <20181212102522.4142d1f0@windsurf>
References: <20181212090458.15747-1-thomas.petazzoni@bootlin.com>
 <20181212102114.7e1baf85@x230.trabucayre.com>
 <20181212102522.4142d1f0@windsurf>
Message-ID: <20181212103433.0bcfc045@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 12 Dec 2018 10:25:22 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> On Wed, 12 Dec 2018 10:21:14 +0100, Gwenhael Goavec-Merou wrote:
> 
> > This issue is also fixed by http://patchwork.ozlabs.org/patch/1011657/  
> 
> Yes, but I think we want to apply my patch first, because it is the
> minimal fix that doesn't depend on the FFTW rework. My patch can then
> be easily backported to the stable branches, because it doesn't depend
> on the heavier FFTW rework.
>
Yes, it's true. And finally  with the rework of FFTW and the fact that fftw
depends on fftw-xx the only thing that is needed is to change the name of the
variables
> 
> And then on top of that, we can of course apply your FFTW rework.
> 
Regards,

Gwen

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 09:36:52 +0100
Subject: [Buildroot] [PATCH v4 17/17] package/liquid-dsp: drop support
 for fftw-double and fftw-long-double
In-Reply-To: <20190206054024.uynf5iyvgzap6u2x@sapphire.tkos.co.il>
References: <1548078671-63318-9-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-10-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-11-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-12-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-13-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-14-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-15-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-16-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-17-git-send-email-gwenj@trabucayre.com>
 <20190205220940.3dbda336@windsurf>
 <20190206054024.uynf5iyvgzap6u2x@sapphire.tkos.co.il>
Message-ID: <20190206093652.2b711831@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 6 Feb 2019 07:40:24 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> > Applied to master, thanks. I have applied *before* all other patches,
> > because it's really a preparation fix that is useful independently from
> > the rest of the FFTW rework.  
> 
> Unfortunately the '#' prefixed lines in the commit log were dropped again.

Yeah, Yann pointed this to me as well. Sadly now it's committed and
pushed, so it's too late. Oh well.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

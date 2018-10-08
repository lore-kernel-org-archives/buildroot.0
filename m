From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 08:43:54 +0200
Subject: [Buildroot] [PATCH 1/1] nmap: update license
In-Reply-To: <c7dcb459-f7fe-9ad6-14cc-f65679ff1ffb@mind.be>
References: <20181004172730.12889-1-fontaine.fabrice@gmail.com>
 <20181006154143.44ec552a@windsurf> <20181006173750.GF2869@scaer>
 <c7dcb459-f7fe-9ad6-14cc-f65679ff1ffb@mind.be>
Message-ID: <20181008084354.67f19f1e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 7 Oct 2018 21:40:18 +0200, Arnout Vandecappelle wrote:
> On 6/10/18 19:37, Yann E. MORIN wrote:
> > So, now, about this specific nmap case... After reviwing the COPYING
> > file, I would just state:
> > 
> >     NMAP_LICENSE = GPL-2.0 w/ exception
> > 
> > But given how specific the nmap project states that they are really
> > *not* compatible with the GPL-2.0, and as such that exception should
> > rather be seen as a restriction to the GPL-2.0. So, this is a totally
> > different license, based on the GPL-2.0, but incompatible with it.
> > 
> > So, in the end, I would just state:
> > 
> >     NMAP_LICENSE = nmap license
> > 
> > and let the user sort the mess on their own, because we can't do much
> > better... :-/  
> 
>  I double-checked the nmap license file and I agree with Yann. "nmap license" is
> the best we can do.
> 
>  To clarify: the license really is GPL-2.0 with OpenSSL exception. The
> "additional restriction" is that they add an interpretation of what "derived
> work" means exactly. It's not really a restriction, but it *does* change the
> meaning of the license, so calling it GPL-2.0 is not accurate.

I don't know if that matters, but Debian calls it nmap-GPL-2.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

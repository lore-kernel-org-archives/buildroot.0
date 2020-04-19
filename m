From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 10:24:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-coherence: select pyasn1
 instead of pyasn
In-Reply-To: <CADvTj4r+2Vk+En2ChzexRakSoY_RXjKbNTMG1dHPS1K8p2tcfQ@mail.gmail.com>
References: <20200413231704.124258-1-james.hilliard1@gmail.com>
 <20200419101835.303af37c@windsurf.home>
 <CADvTj4r+2Vk+En2ChzexRakSoY_RXjKbNTMG1dHPS1K8p2tcfQ@mail.gmail.com>
Message-ID: <20200419102454.1edc926e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 19 Apr 2020 02:21:30 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > Applied to master, thanks. I assume your plan is to get rid of
> > python-pyasn and python-pyasn-modules now?  
> Yep, was just waiting on these to be merged first.

In this sort of situation, you can also send a series of patches. The
fact that they are sent as as series makes it clear that they have a
dependency.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

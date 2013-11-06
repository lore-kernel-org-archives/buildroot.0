From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Wed, 6 Nov 2013 07:14:20 -0600
Subject: [Buildroot] [PATCH 4/5] rpi: rename board folder for consistency
In-Reply-To: <201311061126.20888.yann.morin.1998@free.fr>
References: <cover.1383693880.git.yann.morin.1998@free.fr>
 <5db8e0c38bc04628a5286eb3c90ab0c0ee543b53.1383693880.git.yann.morin.1998@free.fr>
 <20131106111103.1a1f1d13@skate> <201311061126.20888.yann.morin.1998@free.fr>
Message-ID: <OFA793A731.4E0B0EEB-ON86257C1B.0047E822-86257C1B.0048B8F9@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Thomas, All,

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote on 11/06/2013 04:26:20 AM:

> Thomas, All,
> 
> On Wednesday 06 November 2013 11:11:03 Thomas Petazzoni wrote:
> > I'm not sure I agree with this one. I find "rasberrypi" a lot more
> > obvious for the new comer. Maybe our defconfig should also be called
> > rasberrypi_defconfig.
> 
> Well, 'rpi' is a very common nickname for the Raspberry Pi, so I don't
> think there will be confusion for a newcomer (to Buildroot).

I disagree, I was one who didn't really know what rpi stood for because to 
me that acronym has a completely different meaning. I believe I asked you 
to clarify what rpi stood for on the IRC. In order to make the leap to 
what rpi stood for I had to go to the git logs for the board/rpi 
directory. I guess the point being, I agree with Thomas (not that there is 
anything to argue here) and we should assume people are dumb (me included 
:) ) and we should try to eliminate potential confusion.

Thanks,
-Ryan

> On the other hand, all our other boards are using the full name, not a
> shortname/nickname, neither in board/ nor in configs/
> 
> So, in hindsight, I agree with Thomas here: we should use raspberrypi,
> not rpi.
> 
> I'll fix and resubmit.

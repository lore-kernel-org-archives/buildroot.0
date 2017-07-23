From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Jul 2017 09:58:39 +0200
Subject: [Buildroot] [PATCH 20/20] support/testing: add runtime testing
 for init systems
In-Reply-To: <20170722225016.GK9929@scaer>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <95f6965c48dbf2f754818e2bec1f2d3891015475.1500398733.git.yann.morin.1998@free.fr>
 <e1b95878-e58f-c884-4265-8a1dcae14583@mind.be>
 <20170722144552.GE9929@scaer>
 <26a88450-f1cb-a870-136a-936f0e5c9ec7@mind.be>
 <20170722221014.672f9eb2@windsurf> <20170722225016.GK9929@scaer>
Message-ID: <20170723095839.0d11b971@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Jul 2017 00:50:16 +0200, Yann E. MORIN wrote:

> > The patches fixing them are here:
> > 
> >   http://patchwork.ozlabs.org/patch/783135/
> >   http://patchwork.ozlabs.org/patch/783137/
> >   http://patchwork.ozlabs.org/patch/783136/
> > 
> > and nobody reviews them.  
> 
> I gave them a spin here, and they indeed fix the build, but the tests
> are still broken because qemu can't boot the resulting system...
> 
> I'll investigate that tomorrow...

Hum, weird, because I'm pretty sure I tested the test cases with those
patches. I'll test again, maybe I missed something.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

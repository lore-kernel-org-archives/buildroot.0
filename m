From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Oct 2015 22:37:59 +0200
Subject: [Buildroot] [PATCH 2/2 v2] package/nodejs: add version 4.1.2
In-Reply-To: <20151019203543.GD3651@free.fr>
References: <cover.1445277033.git.yann.morin.1998@free.fr>
 <91f96e06dbe44ab711b1bb688892c31886026b59.1445277033.git.yann.morin.1998@free.fr>
 <20151019223038.6346f115@free-electrons.com>
 <20151019203543.GD3651@free.fr>
Message-ID: <20151019223759.104d9e82@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 19 Oct 2015 22:35:43 +0200, Yann E. MORIN wrote:

> > ... and compare it to the patch. You're no longer importing bz2
> > anywhere. Look at the same patch for 0.10 and 0.12, it is importing the
> > bz2 module, just conditionally.
> 
> ACK, I'll fix that commit log.

So the bz2 import is no longer needed at all?

> > We should maybe also upstream our nodejs patches... But that's a
> > separate work.
> 
> I can take a shot at that...

Would be good, but it is definitely not mandatory to get your patch
accepted, of course.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 May 2014 22:58:27 +0200
Subject: [Buildroot] [PATCH] package/avahi: does not build with
 static-only
In-Reply-To: <20140516205144.GC3466@free.fr>
References: <1400256681-30273-1-git-send-email-yann.morin.1998@free.fr>
 <20140516201650.5805db3e@free-electrons.com>
 <20140516184954.GA3466@free.fr>
 <20140516224236.1ce49506@free-electrons.com>
 <20140516205144.GC3466@free.fr>
Message-ID: <20140516225827.420d3dd6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 16 May 2014 22:51:44 +0200, Yann E. MORIN wrote:

> > To me, it doesn't really seem like an impossibility of building Avahi
> > with static libraries. Shouldn't we look a little bit harder at fixing
> > the configure problem?
> 
> The ./configure of avahi explicitly checks that it can link dynamically
> with pthreads.
> 
> I'm not sure why they decided to do that, but since that's what the
> configure does, and does it on purpose, I haven't even tried to see if
> it was really needed. But if upstream decided (for whatever reasons)
> that they want to explicitly check for that, I don't think we should try
> to revert this check.

Ok, fair enough :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

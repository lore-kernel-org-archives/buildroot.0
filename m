From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 11:56:12 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CAAXf6LV8wcWi_dtnMvLnGgSgfJQZrRabZv6O98G+fjxvQScg0Q@mail.gmail.com>
References: <20140223073009.3676E101056@stock.ovh.net>
 <20140223110021.16b6b976@skate>
 <CAAXf6LV8wcWi_dtnMvLnGgSgfJQZrRabZv6O98G+fjxvQScg0Q@mail.gmail.com>
Message-ID: <20140223115612.42f41b57@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 23 Feb 2014 11:16:58 +0100, Thomas De Schampheleire wrote:
> >
> >>    powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/3ce992a663ddf1030a987bb778f8275a8e5fdef0/
> >
> > To be investigated.
> >
> 
> My proposal would be to disable webkit on powerpc. As I wrote in the
> previous analysis mail, there is already an upstream bug report for
> this, without a lot of feedback. If someone wants to have webkit on
> powerpc, he/she should take the matter upstream.
> 
> If you agree, I can send a patch for it...

I'm fine with this solution.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Oct 2013 22:54:07 +0100
Subject: [Buildroot] [PATCH] arch/mips: Set BR2_GCC_TARGET_ARCH for MIPS
In-Reply-To: <CAAXf6LW4angtN30SpTaU=gOXP0r9YWHBug1-uVVgejnHcm1U=g@mail.gmail.com>
References: <1382970069-16449-1-git-send-email-markos.chandras@imgtec.com>
 <20131030184534.7bf2477b@skate>
 <CAAXf6LVCOqiCdQfy+S_YRiA2c1fzGpip36=hM4c6M+cV=S47og@mail.gmail.com>
 <20131031102253.1aeaea28@skate>
 <CAAXf6LVZW++12ECLBa0MoHUdjFKXdYy0ueoSk4a6WpvxYuAyJA@mail.gmail.com>
 <52722E32.7050307@mind.be> <20131031114727.681766bb@skate>
 <CAAXf6LVY7YE0ZmtT7EFouvnvRpja4sqdWV+ceYU_e9-iHVQyqw@mail.gmail.com>
 <20131031155521.7c17a702@skate>
 <CAAXf6LW4angtN30SpTaU=gOXP0r9YWHBug1-uVVgejnHcm1U=g@mail.gmail.com>
Message-ID: <20131031225407.5e5e2e40@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 31 Oct 2013 18:10:36 +0100, Thomas De Schampheleire wrote:

> Ah, I had interpreted this branch according to the strategy discussed
> at last BDD regarding the community organization. In that discussion,
> such aggregation of submitted patches was also proposed. I thought you
> were acting in that mode.
> 
> In that more general case, where there would me more than one
> maintainer-proxy, the exact strategy is still somewhat unclear to me.

I think the strategy for multiple maintainer-proxy hasn't been really
defined precisely. I believe that the thing we really believed in was
the addition of Acked-by/Tested-by information in the list of patches
in patchwork (both command line and web). This way Peter can much more
easily see which patches have received Acked-by/Tested-by, and look at
these with an higher priority. This would make the Acked-by/Tested-by
more useful, and potentially encourage us and others to do more of
those Acked-by/Tested-by.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

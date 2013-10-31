From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Oct 2013 11:30:56 +0100
Subject: [Buildroot] [PATCH] arch/mips: Set BR2_GCC_TARGET_ARCH for MIPS
In-Reply-To: <CAAXf6LVZW++12ECLBa0MoHUdjFKXdYy0ueoSk4a6WpvxYuAyJA@mail.gmail.com>
References: <1382970069-16449-1-git-send-email-markos.chandras@imgtec.com>
 <20131030184534.7bf2477b@skate>
 <CAAXf6LVCOqiCdQfy+S_YRiA2c1fzGpip36=hM4c6M+cV=S47og@mail.gmail.com>
 <20131031102253.1aeaea28@skate>
 <CAAXf6LVZW++12ECLBa0MoHUdjFKXdYy0ueoSk4a6WpvxYuAyJA@mail.gmail.com>
Message-ID: <20131031113056.03b1b6d5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 31 Oct 2013 11:13:33 +0100, Thomas De Schampheleire wrote:

> It would be great if we could add extra states to the patchwork
> configuration. I looked at the patchwork sources, which has an xml
> file with the different states, but it was unclear to me where this
> file is read, and whether it is project specific or patchwork-global.
> 
> Do note that it is possible to change the search filter, and specify
> 'Nobody' in the Delegate field. Since the search is HTTP/GET based,
> you can add this URL as a bookmark.
> http://patchwork.ozlabs.org/project/buildroot/list/?delegate=-

Interesting, thanks for looking into this.

> > I've been quite conservative on the patches I've taken (i.e no new
> > packages or version bumps), so I'm pretty confident that Peter should
> > take all of them.
> 
> I have no doubt on your good judgement here. I'm only considering what
> will happen if several people start acting as a maintainer-proxy. In
> patchwork, it will not be visible at all who has taken a given patch.
> Suppose that for some reason the maintainer-proxy forgets about the
> patch, then it will be lost unless the submitter notices it and pings.

I agree. I will try to update the patches and move them back into the
Delegate To state.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

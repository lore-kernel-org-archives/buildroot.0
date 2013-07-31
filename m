From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 10:02:44 +0200
Subject: [Buildroot] Patches to merge before -rc1 ?
In-Reply-To: <CAEvN+1iHZ321XD7RMp4GKs6sdohsOn9y4BezrXotrW9hdpOkfA@mail.gmail.com>
References: <20130727161633.72e96e49@skate>
 <CAEvN+1iHZ321XD7RMp4GKs6sdohsOn9y4BezrXotrW9hdpOkfA@mail.gmail.com>
Message-ID: <20130731100244.588ecdae@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Tzu-Jung Lee,

On Sun, 28 Jul 2013 00:32:39 +0800, Tzu-Jung Lee wrote:

> I got a pending patch for review:
> 
>   http://patchwork.ozlabs.org/patch/252525/

I merged this one.

> And I've been using using the patch from Alexey Brodkin
> <alexey.brodkin@synopsys.com>
> It works fine for me, and perhaps you'd like to review it?
> 
>   http://patchwork.ozlabs.org/patch/171335/

I know Yann E. Morin started reviewing it a while ago, but gave up due
to the patch complexity and some issues that were complex to solve. But
I'm inclined to merge it as is anyway, and fix up the issues as they
show up. This vlc stuff has been out of tree for too long. Yann, what's
your position on this?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

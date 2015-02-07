From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Feb 2015 11:10:06 +0100
Subject: [Buildroot] [PATCH] sna/dri2: Protect compsiteext.h include
 with build check
In-Reply-To: <20140723223626.GA759@bwidawsk.net>
References: <1405661249-6506-1-git-send-email-ben@bwidawsk.net>
 <1405665634-3299-1-git-send-email-chris@chris-wilson.co.uk>
 <20140718232336.GA5940@bwidawsk.net>
 <20140723234458.7399f7b6@free-electrons.com>
 <20140723223626.GA759@bwidawsk.net>
Message-ID: <20150207111006.5cbc28c6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ben Widawsky,

On Wed, 23 Jul 2014 15:36:27 -0700, Ben Widawsky wrote:

> Hi. The second patch, .912 bump has been nak'd already by Bernd (I
> missed this before my ping). Coincidentally, Bernd also fixed the
> composite extension compilation error in buildroot (differently than I
> did). Chris Wilson, the Intel DDX maintainer has fixed the issue
> meanwhile.
> 
> I would recommend backporting the xf86-video-intel patch instead of the
> patch Bernd submitted. Wiggle handled all the conflicts. I am not sure
> if it will apply to .907 (the current version). The other option is to
> take Bernd's patch, and revert it when you finally get to the fixed
> upstream version.
> 
> In the most ideal case, we could just bump to the recently released .913 and
> have everything /just/ work. Chris has fixed 2 bugs that Bernd's series also
> attempted to fix. Of course that runs the risk of invoking the wrath that
> caused the original .912 revert.
> 
> That all came out more complicated than it should have. I apologize. I am
> pasting the patch I wiggled as an example. Hopefully that helps make sense.

Have all issues you had been resolved? I still have this old e-mail
"marked" as to be handled here, so I'm wondering what is the status of
this. Could you check if the latest Buildroot git master works for you?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

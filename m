From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 13 Nov 2013 09:42:47 +0100
Subject: [Buildroot] menuconfig / legacy bug
In-Reply-To: <CAAXf6LUhpgN16gBY_WFnq=kSepT-LHt-Q3Js-cAHwSUGd2CL6w@mail.gmail.com>
 (Thomas De Schampheleire's message of "Wed, 13 Nov 2013 09:40:53
 +0100")
References: <20131112224328.4edae7b0@skate>
 <CAAXf6LUhpgN16gBY_WFnq=kSepT-LHt-Q3Js-cAHwSUGd2CL6w@mail.gmail.com>
Message-ID: <87y54s1ym0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

> I cannot reproduce this problem on my end. I followed the exact steps
> as you described.
> This is on Linux Mint 15, not sure which packages would be relevant
> here. Ncurses is:
> lib32ncurses5-dev: 5.9-10ubuntu4

You need to ensure that you haven't scrolled too far down. The extra
comment lines have to be visible on the screen for the bug to occur.

-- 
Bye, Peter Korsgaard

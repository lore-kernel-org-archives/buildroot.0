From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 15 Aug 2011 14:10:39 +0200
Subject: [Buildroot] /run/udev missing ?
In-Reply-To: <1313400852.26653.4.camel@sven> (Sven Neumann's message of "Mon, 
 15 Aug 2011 11:34:11 +0200")
References: <1313137798.1017.5.camel@sven>
 <87ty9kh4sh.fsf@macbook.be.48ers.dk> <1313396462.31752.3.camel@sven>
 <878vqvgi3g.fsf@macbook.be.48ers.dk> <1313400852.26653.4.camel@sven>
Message-ID: <874o1iho3k.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

Hi,

 >> Compared to udev, devtmpfs is very lightweight. I would recommend
 >> pure devtmpfs (no mdev/udev) to people using static /dev today.

 Sven> Well, we need udev to load the firmware of our Wifi module. Of
 Sven> course I can try to switch to dynamic device management, but I
 Sven> thought I'd rather point out that a setup broke that the
 Sven> buildroot configuration allows and that used to work.

 Sven> If this is not supposed to work, then it should probably be
 Sven> disallowed in the buildroot configuration. In other words, if
 Sven> udev is selected, static device management should not be
 Sven> selectable.

Ahh yes, good idea - Fixed in git.

-- 
Bye, Peter Korsgaard

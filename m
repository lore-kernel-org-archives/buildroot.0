From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 Mar 2012 12:21:03 +0100
Subject: [Buildroot] [PATCH] pixman: bump version and compilation fix
In-Reply-To: <1331546529-22150-1-git-send-email-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Mon, 12 Mar 2012 11:02:09
 +0100")
References: <1331546529-22150-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <8762ea6p5s.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 yegorslists> From: Yegor Yefremov <yegorslists@googlemail.com>
 yegorslists> - bump to 2.5 and change download location
 yegorslists> - disable iwmmxt support for CPU's that don't have
 yegorslists>   this feature

Committed, thanks.

I see there's also some other asm-level optimization options we might
need to handle in the future, but ok.

-- 
Bye, Peter Korsgaard

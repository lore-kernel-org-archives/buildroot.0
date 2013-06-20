From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jun 2013 19:40:09 +0200
Subject: [Buildroot] Xenomai package not extracted in time
In-Reply-To: <000501ce6dda$fca14a90$f5e3dfb0$@z9.com>
References: <02de01ce6dd0$bb38f3a0$31aadae0$@spamcop.net>
 <20130620184222.37b73ce2@skate>
 <000501ce6dda$fca14a90$f5e3dfb0$@z9.com>
Message-ID: <20130620194009.55364faf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear George Pontis,

Please don't reply to me only, but also to the list.

On Thu, 20 Jun 2013 10:24:14 -0700, George Pontis wrote:
> Thanks for your attention Thomas. I look forward to a fix, but in the short
> term I'll look at the commit and see if I can back it out temporarily since
> we only use Xenomai.

Backing out the commit will be hard because many other related changes
have been done since then.

You can try adding a line like:

linux-patch: xenomai-extract

in the linux/linux-ext-xenomai.mk.

Completely untested, of course.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

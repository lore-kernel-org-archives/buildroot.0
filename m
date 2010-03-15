From: cmc2001 <craig.mcfarlane@pri.com.au>
Date: Sun, 14 Mar 2010 21:43:17 -0700 (PDT)
Subject: [Buildroot]  Core Files on ARM
Message-ID: <27900409.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


TWIMC,
Forgive the noob question, but we have a busybox'd target which we've
configured to produce partial core files when our app crashes.  However, it
seems to only have spotty backtrace information - specifically, only a stack
trace for one thread.

Busybox 1.13.4
g++ 4.2.1
kernel 2.6.28.2

I know I'm not alone after trawling google, but I'm yet to find anything
approaching a definitive answer.

I've been banging my head on this problem for several days now and the more
I dig, the more possible problems I discover (the latest being the g++ ARM
toolchain and its limitations).  Would this corefile problem be resolved if
I moved up to:

Busybox 1.15.3
gcc 4.4.3
kernel 2.6.29.4

Also, if Busybox's menus is dumbing down my control of corefiles a little
too much, is there an agreed way of subverting it that won't get me into
trouble down the track?

cya
Craig
-- 
View this message in context: http://old.nabble.com/Core-Files-on-ARM-tp27900409p27900409.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2012 10:03:49 +0100
Subject: [Buildroot] [PATCH] busybox: add watchdog daemon startup script
In-Reply-To: <201202090004.34325.arnout@mind.be>
References: <1328686893-6841-1-git-send-email-fabio.porcedda@telit.com>
 <20120208222639.36359e6a@skate> <201202090004.34325.arnout@mind.be>
Message-ID: <20120209100349.67730016@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 9 Feb 2012 00:04:34 +0100,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>  NACK.  Many people will want to use watchdog in a different way.
> And it may be installed as S<someothernumber>watchdog so the check if
> it exists already doesn't help.

Many of our packages install a default init script, which can always be
overridden in the filesystem skeleton or through the post-build script.
So what shouldn't we do the same here?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

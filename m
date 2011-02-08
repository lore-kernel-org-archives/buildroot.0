From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Feb 2011 08:41:16 +0100
Subject: [Buildroot] [PATCH] socat: enable TERMIOS
In-Reply-To: <4D2AD412.7080204@visionsystems.de> (Yegor Yefremov's message of
	"Mon, 10 Jan 2011 10:40:34 +0100")
References: <4D2AD412.7080204@visionsystems.de>
Message-ID: <87k4hbug6b.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

 Yegor> Enable TERMIOS handling in socat, so that such options as echo,
 Yegor> raw etc.  could be used for serial connections.

Fixed it while converting it to autotargets, thanks.

-- 
Bye, Peter Korsgaard

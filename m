From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Sep 2009 12:22:03 +0200
Subject: [Buildroot] [PATCH] Rename BASE_DIR to OUTPUT_DIR
In-Reply-To: <1253700233-11103-1-git-send-email-mroth@nessie.de> (Michael
	Roth's message of "Wed\, 23 Sep 2009 12\:03\:53 +0200")
References: <1253700233-11103-1-git-send-email-mroth@nessie.de>
Message-ID: <878wg6rmes.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Roth <mroth@nessie.de> writes:

 Michael> To reflect the new output directory hierarchy rename the Makefile
 Michael> variable BASE_DIR to OUTPUT_DIR.

 Michael> Signed-off-by: Michael Roth <mroth@nessie.de>

Hmm, this will presumably break downloads for people trying to reuse
their existing .config? (E.G. DL_DIR gets to point to /dl).

I agree that BASE_DIR isn't the most telling name for what it does, but
I'm not sure it's worth the trouble.

-- 
Bye, Peter Korsgaard

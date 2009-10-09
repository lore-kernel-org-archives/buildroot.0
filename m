From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Oct 2009 14:40:05 +0200
Subject: [Buildroot] [PATCH 06/23] qt: remove TARGET_CONFIGURE_OPTS from
	make invocation
In-Reply-To: <1254907246-5650-7-git-send-email-mroth@nessie.de> (Michael
	Roth's message of "Wed\, 7 Oct 2009 11\:20\:29 +0200")
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-7-git-send-email-mroth@nessie.de>
Message-ID: <87fx9sg2qi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Roth <mroth@nessie.de> writes:

 Michael> All compiler options, switches and path settings are done in the
 Michael> configure step. For the compile and install step there is no need
 Michael> for the TARGET_CONFIGURE_OPTS variables.

Committed, thanks.

-- 
Bye, Peter Korsgaard

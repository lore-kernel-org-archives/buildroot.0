From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Feb 2014 10:22:16 +0100
Subject: [Buildroot] [PATCH 2/2] Makefile: Add /usr/lib/locale to
	target-purgelocales
In-Reply-To: <1349204631-21077-3-git-send-email-gvaxon@gmail.com> (Valentine
 Barshak's message of "Tue, 2 Oct 2012 23:03:51 +0400")
References: <1349204631-21077-1-git-send-email-gvaxon@gmail.com>
 <1349204631-21077-3-git-send-email-gvaxon@gmail.com>
Message-ID: <87lhxri65z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Valentine" == Valentine Barshak <gvaxon@gmail.com> writes:

Hi,

 > Some packages install locales to /usr/lib/locale.
 > Parse and purge unneeded ones there too.

Sorry for the delay - Commited, thanks.

-- 
Bye, Peter Korsgaard

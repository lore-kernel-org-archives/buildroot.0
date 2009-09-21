From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 21 Sep 2009 21:26:55 +0200
Subject: [Buildroot] [PATCH] samba: explicitly link with -pthread if
	avahi support is enabled
In-Reply-To: <1253551690-31652-1-git-send-email-s.neumann@raumfeld.com> (Sven
	Neumann's message of "Mon\, 21 Sep 2009 18\:48\:10 +0200")
References: <1253551690-31652-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <877hvsumio.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> The avahi-client library makes use of threads. We need to link the
 Sven> smbd binary with -pthread if avahi support is enabled. Otherwise the
 Sven> binary will crash at startup.

Committed, thanks.

-- 
Bye, Peter Korsgaard

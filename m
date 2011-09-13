From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 13 Sep 2011 23:29:20 +0200
Subject: [Buildroot] [PATCH 2/2] samba: fix linking of smbd with avahi
	support
In-Reply-To: <1315903328-20842-3-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Tue, 13 Sep 2011 10:42:08 +0200")
References: <87zki95urn.fsf@macbook.be.48ers.dk>
 <1315903328-20842-1-git-send-email-s.neumann@raumfeld.com>
 <1315903328-20842-3-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87ipowuo5r.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Expliticly link with -lpthread if smbd is compiled with
 Sven> avahi support. Otherwise the binary will fail to run.

Committed, thanks.

-- 
Bye, Peter Korsgaard

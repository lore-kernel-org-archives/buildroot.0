From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 14 Nov 2012 23:04:06 +0100
Subject: [Buildroot] [PATCH] Revert "auto{conf,
	make}: only make available on archs supported by qemu"
In-Reply-To: <1352508025-32365-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sat, 10 Nov 2012 01:40:25 +0100")
References: <1352508025-32365-1-git-send-email-arnout@mind.be>
Message-ID: <87haor7sfd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> Since perl no longer requires host-qemu, autoconf and automake work
 Arnout> again on the architectures that are not supported by host-qemu.

 Arnout> This reverts commit c65d92e8e2767b09aaee6b717cbd9b66f88ea39c.

Committed, thanks.

-- 
Bye, Peter Korsgaard

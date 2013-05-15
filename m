From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 May 2013 16:05:54 +0200
Subject: [Buildroot] [PATCH 1/2] graph-depends: ignore the
	'target-generic-dont-remount-rw' target
In-Reply-To: <1368605463-20677-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Wed, 15 May 2013 10:11:02 +0200")
References: <1368605463-20677-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87li7gpccd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 Luca> The graph-depends script tries to call 'make
 Luca> target-generic-dont-remount-rw', which doesn't exist since
 Luca> 'target-generic-dont-remount-rw' is not a package.

 Luca> See also the comments for commit 72bd61e5b8c2094378.

Committed, thanks.

-- 
Bye, Peter Korsgaard

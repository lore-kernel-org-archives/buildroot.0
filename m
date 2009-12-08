From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Dec 2009 09:55:10 +0100
Subject: [Buildroot] [PATCH] Add fuse-sshfs package
In-Reply-To: <1259080149-15678-1-git-send-email-daniel@caiaq.de> (Daniel
	Mack's message of "Tue, 24 Nov 2009 17:29:09 +0100")
References: <87fx83dh7z.fsf@macbook.be.48ers.dk>
	<1259080149-15678-1-git-send-email-daniel@caiaq.de>
Message-ID: <87vdghonf5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

 Daniel> Signed-off-by: Daniel Mack <daniel@caiaq.de>

Committed, thanks. I slightly tweaked kconfig to use select for the
library dependencies instead of depends.

-- 
Bye, Peter Korsgaard

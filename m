From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Apr 2010 16:55:06 +0200
Subject: [Buildroot] [PATCH] initramfs: fix init symlink
In-Reply-To: <1271773861-26198-1-git-send-email-will_wagner@carallon.com>
	(Will Wagner's message of "Tue, 20 Apr 2010 15:31:01 +0100")
References: <1271773861-26198-1-git-send-email-will_wagner@carallon.com>
Message-ID: <87r5ma9nsl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

 Will> When initramfs was ported to the new fs structure the init symlink
 Will> macro was defined, but forgot to add it to PRE_GEN_HOOKS

Committed, thanks!

-- 
Bye, Peter Korsgaard

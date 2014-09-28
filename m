From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Sep 2014 22:05:55 +0200
Subject: [Buildroot] [PATCH] dosfstools: Fixed compilation with musl libc
In-Reply-To: <1410412570-2427-1-git-send-email-maarten@treewalker.org>
 (Maarten ter Huurne's message of "Thu, 11 Sep 2014 07:16:10 +0200")
References: <1410412570-2427-1-git-send-email-maarten@treewalker.org>
Message-ID: <87lhp3tsrg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maarten" == Maarten ter Huurne <maarten@treewalker.org> writes:

 > The Makefile of dosfstools passes -D_GNU_SOURCE to get access to
 > non-standard definitions such as 'loff_t'. But this flag got lost
 > in the CFLAGS override.

You forgot to add your signed-off-by, but you've added it to the other
patches so I took the liberty of adding it here, hopefully that is OK.

Committed with a slightly extended commit message, thanks.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Sep 2014 23:59:27 +0200
Subject: [Buildroot] [PATCH v2] memstat: Add patch to fix compilation
	with musl libc
In-Reply-To: <1410749618-6304-1-git-send-email-maarten@treewalker.org>
 (Maarten ter Huurne's message of "Mon, 15 Sep 2014 04:53:38 +0200")
References: <20140913224356.174954fc@free-electrons.com>
 <1410749618-6304-1-git-send-email-maarten@treewalker.org>
Message-ID: <87vboc1xz4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maarten" == Maarten ter Huurne <maarten@treewalker.org> writes:

 > PATH_MAX was undefined because of a missing #include.
 > Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard

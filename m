From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Sep 2014 23:10:20 +0200
Subject: [Buildroot] [PATCH] Revert "SDL_image: fix runtime libjpeg
	failure"
In-Reply-To: <1409710352-6375-1-git-send-email-maarten@treewalker.org>
 (Maarten ter Huurne's message of "Wed, 3 Sep 2014 04:12:32 +0200")
References: <1409710352-6375-1-git-send-email-maarten@treewalker.org>
Message-ID: <87r3zrozwj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maarten" == Maarten ter Huurne <maarten@treewalker.org> writes:

 > This reverts commit 883f066797ae0e7a017fac8e275f6e58659db760.
 > Bug in configure script was fixed upstream in SDL_image 1.2.8.

 > Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard

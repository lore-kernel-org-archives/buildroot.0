From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Oct 2017 19:19:36 +0200
Subject: [Buildroot] [PATCH] redis: bump to version 3.2.11
In-Reply-To: <20171026124415.30102-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 26 Oct 2017 14:44:15 +0200")
References: <20171026124415.30102-1-peter@korsgaard.com>
Message-ID: <874lqjkx5j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > 3.2.11 fixes important issues. From the release notes:
 > ================================================================================
 > Redis 3.2.11     Released Thu Sep 21 15:47:53 CEST 2017
 > ================================================================================

 > Upgrade urgency HIGH: Potentially critical bugs fixed.

 > AOF flush on SHUTDOWN did not cared to really write the AOF buffers
 > (not in the kernel but in the Redis process memory) to disk before exiting.
 > Calling SHUTDOWN during traffic resulted into not every operation to be
 > persisted on disk.

 > Also add a hash for the license file while we're at it.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard

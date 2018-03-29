From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Mar 2018 21:21:23 +0200
Subject: [Buildroot] [PATCH] e2fsprogs: bump to version 1.44.1
In-Reply-To: <20180329141515.12399-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 29 Mar 2018 16:15:15 +0200")
References: <20180329141515.12399-1-peter@korsgaard.com>
Message-ID: <87a7uq8z7w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > From the release notes (https://lwn.net/Articles/750103/):
 > E2fsprogs 1.44.0 introduced a regression introduced which caused e2fsck
 > to fail to support HTree directories on big-endian systems.  Fix how we
 > read block numbers for internal htree nodes.

 > Removed a potential memory leak from fsck.

 > E2image now correctly creates e2image files for bigalloc file systems.

 > Dumpe2fs and debugfs now correctly support e2image files for file
 > systems that have the meta_bg option enabled.

 > E2fsck and debugfs now correctly handle delete inodes (including
 > processing the orphaned inode list in the case of e2fsck) for bigalloc
 > file systems.  (Addresses Google Bug: #73795618)

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Mar 2018 16:42:57 +0200
Subject: [Buildroot] [PATCH] e2fsprogs: bump to version 1.44.1
In-Reply-To: <20180329141515.12399-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 29 Mar 2018 16:15:15 +0200")
References: <20180329141515.12399-1-peter@korsgaard.com>
Message-ID: <87r2o37xji.fsf@dell.be.48ers.dk>
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
 > ---
 >  package/e2fsprogs/e2fsprogs.hash | 2 +-
 >  package/e2fsprogs/e2fsprogs.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
 > index 812dfbe320..ffe111641a 100644
 > --- a/package/e2fsprogs/e2fsprogs.hash
 > +++ b/package/e2fsprogs/e2fsprogs.hash
 > @@ -1,5 +1,5 @@
 >  # From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.44.0/sha256sums.asc
 > -sha256 a3567042f03fcee0e01db8f923b24cec92e2ba5b11f8e39e245672ad5392723d  e2fsprogs-1.44.0.tar.xz
 > +sha256 0ca164c1c87724df904c918b2d7051ef989b51de725db66c67514dbe6dd2b9ef  e2fsprogs-1.44.1.tar.xz

Ups, forgot to change the URL above. Will fix when I apply.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Dec 2016 15:59:44 +0100
Subject: [Buildroot] [PATCH] fs/ext2: default to ext2 rev1
In-Reply-To: <20161213081827.28081-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 13 Dec 2016 09:18:27 +0100")
References: <20161213081827.28081-1-peter@korsgaard.com>
Message-ID: <8760mm1rq7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Rev0 is very old (E.G. from before Linux was maintained in git), the kernel
 > prints a scary warning when used:

 > EXT4-fs warning (device sda): ext4_update_dynamic_rev:746: updating to rev 1
 > because of new feature flag, running e2fsck is recommended

 > And rev0 support is broken in u-boot 2016.11:
 > http://lists.denx.de/pipermail/u-boot/2016-December/275916.html

 > So default to rev1 instead.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 09:42:25 +0200
Subject: [Buildroot] [PATCH] support/check-bin-arch: ignore /usr/lib/grub
In-Reply-To: <20190507124345.6424-1-alex_y_xu@yahoo.ca> (Alex Xu's message of
 "Tue, 7 May 2019 08:43:45 -0400")
References: <20190507124345.6424-1-alex_y_xu@yahoo.ca>
Message-ID: <871s07uplq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alex" == Alex Xu (Hello71) <alex_y_xu@yahoo.ca> writes:

 > /lib/grub is already ignored, so add /usr/lib/grub to support
 > BR2_ROOTFS_MERGED_USR.

 > Signed-off-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard

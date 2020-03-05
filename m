From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Mar 2020 23:39:43 +0100
Subject: [Buildroot] [PATCH] board/ci20/genimage.cfg: drop hardcoded
 rootfs partition size
In-Reply-To: <20200121210301.28973-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 21 Jan 2020 22:03:00 +0100")
References: <20200121210301.28973-1-peter@korsgaard.com>
Message-ID: <87y2se8lzk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > As recently reported to the list:
 > http://lists.busybox.net/pipermail/buildroot/2020-January/271937.html

 > The hardcoded rootfs partition size can lead to hard to understand build
 > failures if more packages are added.

 > So drop the hardcoded partition size.  Genimage will then size the partition
 > to match the size of the rootfs image (which by default is also 60MB for ext4).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 12:49:56 +0100
Subject: [Buildroot] [PATCH 1/1] fs/common.mk: Fix show-build-order
In-Reply-To: <20181115152541.27596-1-serj.kalichev@gmail.com> (Serj Kalichev's
 message of "Thu, 15 Nov 2018 18:25:41 +0300")
References: <20181115152541.27596-1-serj.kalichev@gmail.com>
Message-ID: <87zhtwxdln.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Serj" == Serj Kalichev <serj.kalichev@gmail.com> writes:

 > The command "make show-build-order" doesn't show dependencies of rootfs-common target.
 > This patch adds $(ROOTFS_COMMON_DEPENDENCIES) to PACKAGES variable.

 > Signed-off-by: Serj Kalichev <serj.kalichev@gmail.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard

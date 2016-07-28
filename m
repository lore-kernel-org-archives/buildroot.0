From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jul 2016 22:15:21 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain-external: update ARMeb musl
	dependency
In-Reply-To: <1469713154-10898-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 28 Jul 2016 15:39:13 +0200")
References: <1469713154-10898-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871t2dv7s6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > ARM big-endian is different from ARMv4/5/6 and ARMv7. Big-endian on
 > ARMv4/5/6 is BE-32 while big-endian on ARMv7 is BE-8, which are not
 > compatible.

 > Therefore, the musl big endian toolchain that is built for ARMv4
 > cannot work for ARMv7, it can only work for ARMv4/5/6.

 > This commit updates the musl toolchain dependency accordingly.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

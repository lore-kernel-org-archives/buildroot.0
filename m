From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 22:59:25 +0200
Subject: [Buildroot] [PATCH 2/2] configs/s6lx9_microboard_defconfig:
 purge custom dts boolean
In-Reply-To: <20180313180006.5364-2-rafal.susz@gmail.com> (Rafal Susz's
 message of "Tue, 13 Mar 2018 19:00:06 +0100")
References: <20180313142635.27423-1-rafal.susz@gmail.com>
 <20180313180006.5364-1-rafal.susz@gmail.com>
 <20180313180006.5364-2-rafal.susz@gmail.com>
Message-ID: <87y3i8rmfm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rafal" == Rafal Susz <rafal.susz@gmail.com> writes:

 > Since custom dts files are unconditionally handled *KERNEL_USE_CUSTOM_DTS
 > is no longer available/needed.

 > Signed-off-by: Rafal Susz <rafal.susz@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

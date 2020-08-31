From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Aug 2020 17:15:01 +0200
Subject: [Buildroot] [PATCH] libcap: disable GOLANG
In-Reply-To: <1f3d9456-9ca2-75f4-7e15-d851e65005ea@aliyun.com> (Tian Yuanhao
 via buildroot's message of "Mon, 31 Aug 2020 10:16:41 +0800")
References: <1f3d9456-9ca2-75f4-7e15-d851e65005ea@aliyun.com>
Message-ID: <873642deyy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Tian" == Tian Yuanhao via buildroot <buildroot@busybox.net> writes:

 > libcap is a pure C library before 2.27, it lacks some environment
 > variables set in pkg-golang.mk.

 > Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>

Can you be more specific? What exactly is this fixing? I don't see any
related autobuilder errors?

http://autobuild.buildroot.net/?reason=libcap-2.27

And I don't see any reference to GOLANG in libcap-2.27?

-- 
Bye, Peter Korsgaard

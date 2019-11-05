From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Nov 2019 22:20:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/dtc: Bump to v1.5.1
In-Reply-To: <20191025200034.199561-1-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Fri, 25 Oct 2019 22:00:34 +0200")
References: <20191025200034.199561-1-titouan.christophe@railnova.eu>
Message-ID: <87sgn2dnqu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > Remove 0002-Makefile-Add-EXTRA_CFLAGS-variable.patch which is now
 > applied upstream

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

Given that this breaks a number of defconfigs I have reverted this for
2019.11.

We can find a solution and add it again in next.

-- 
Bye, Peter Korsgaard

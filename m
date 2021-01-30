From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 13:39:53 +0100
Subject: [Buildroot] [PATCH 1/2] board/qemu/sh4*: Remove linux-headers
 patch
In-Reply-To: <20210127115648.15340-1-geoffrey.legourrierec@gmail.com>
 ("Geoffrey Le =?utf-8?Q?Gourri=C3=A9rec=22's?= message of "Wed, 27 Jan 2021
 12:56:47 +0100")
References: <20210127115648.15340-1-geoffrey.legourrierec@gmail.com>
Message-ID: <87bld6tx7q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Geoffrey" == Geoffrey Le Gourri?rec <geoffrey.legourrierec@gmail.com> writes:

 > Previous patch about time data structures [1] provided a dirty fix
 > that did not solve the real issue.

 > After discussing with Linux folks on the SuperH mailing list [2],
 > the patch was deemed unnecessary, as the problem lied in uclibc.

 > [1] https://git.buildroot.net/buildroot/commit/?id=742f37de8d0e3797698411dfc6a63bd7e98aafe2
 > [2] https://patchwork.kernel.org/project/linux-sh/patch/20210123165652.10884-1-geoffrey.legourrierec at gmail.com/

 > Signed-off-by: Geoffrey Le Gourri?rec <geoffrey.legourrierec@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

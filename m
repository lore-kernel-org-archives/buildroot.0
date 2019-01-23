From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 16:16:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/udisks: Fix compilation issue
 with missing sys/sysmacros.h
In-Reply-To: <20181231091551.6335-1-vadim4j@gmail.com> (Vadim Kochan's message
 of "Mon, 31 Dec 2018 11:15:51 +0200")
References: <20181231091551.6335-1-vadim4j@gmail.com>
Message-ID: <875zufl7zx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vadim" == Vadim Kochan <vadim4j@gmail.com> writes:

 > It fixes compilation error with undefined "minor", "major" and
 > "makedev" objects which caused by missing include of <sys/sysmacros.h>

 > These definitions were moved to <sys/sysmacros.h> in newer gibc.

 > Fixes: http://autobuild.buildroot.net/results/74a8d8c247cfc9c0024e749e1f1ac423c9e90855/

 > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard

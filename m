From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Dec 2014 12:59:16 +0100
Subject: [Buildroot] [PATCH] live555: fix test programs target
	installation
In-Reply-To: <c7c68a682b5c2a31db07f2ba1bec4cae5384b316.1417514695.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 2 Dec 2014 12:04:55 +0200")
References: <c7c68a682b5c2a31db07f2ba1bec4cae5384b316.1417514695.git.baruch@tkos.co.il>
Message-ID: <87tx1e1cvf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Commit 43ebd93e1fcb (live555: add error handling to for loop) removed the
 > shell command delimiter. Add it back.

 > Fixes:
 > http://autobuild.buildroot.net/results/00f/00f26fa3b6fc8c707009f44ede7b680849f18d5f/

 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard

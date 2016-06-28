From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jun 2016 13:03:50 +0200
Subject: [Buildroot] [PATCH] package/mono: fix sigcontext incorrect
	include
In-Reply-To: <1467059351-20171-1-git-send-email-angelo.compagnucci@gmail.com>
 (Angelo Compagnucci's message of "Mon, 27 Jun 2016 22:29:11 +0200")
References: <1467059351-20171-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <87oa6lo9rd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > This patch solves incorrect inclusion of sigcontext.h on musl.
 > The patch was submitted upstream.

 > Fixes: http://autobuild.buildroot.net/results/bec/beced92f3ef81f201c0dc9178c7ff6fad0bc45e7/
 > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

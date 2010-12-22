From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Dec 2010 22:33:12 +0100
Subject: [Buildroot] [PATCH 2/2] tslib: Enable raw module in ts.conf
In-Reply-To: <1292954816-19987-2-git-send-email-daniel.nystrom@timeterminal.se>
	("Daniel =?utf-8?Q?Nystr=C3=B6m=22's?= message of "Tue, 21 Dec 2010
	19:06:56 +0100")
References: <1292954816-19987-1-git-send-email-daniel.nystrom@timeterminal.se>
	<1292954816-19987-2-git-send-email-daniel.nystrom@timeterminal.se>
Message-ID: <87k4j1trvr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Nystr?m <daniel.nystrom@timeterminal.se> writes:

 Daniel> By default there is no module activated in ts.conf. According to the
 Daniel> ts.conf previously attached in the tslib package dir (which was never
 Daniel> installed) the default module of choice was the raw module.

 Daniel> This patch enables the raw module in the ts.conf file in the tslib
 Daniel> source tree, which will be installed in the target.

Committed, thanks.

-- 
Bye, Peter Korsgaard

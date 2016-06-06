From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Jun 2016 21:42:45 +0200
Subject: [Buildroot] [PATCH] python-serial: fix Python 2.7.x related
	compilation error
In-Reply-To: <1465212611-2210-1-git-send-email-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Mon, 6 Jun 2016 13:30:11
 +0200")
References: <1465212611-2210-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <877fe2hznu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > aio.py is an experimental module, that is compatible with
 > Python 3 only, so remove it for Python 2 environment or it
 > will cause compilation errors.

 > Fixes:
 > http://autobuild.buildroot.org/results/f26/f26351da925d6ef3adea8053dc7fc24061554daf/

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

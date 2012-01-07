From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 07 Jan 2012 20:54:08 +0100
Subject: [Buildroot] [PATCH v5 1/6] Python: add external modules option
In-Reply-To: <1325676605-31194-2-git-send-email-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Wed, 4 Jan 2012 12:30:00
 +0100")
References: <1325676605-31194-1-git-send-email-yegorslists@googlemail.com>
 <1325676605-31194-2-git-send-email-yegorslists@googlemail.com>
Message-ID: <87boqfgufz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 yegorslists> From: Yegor Yefremov <yegorslists@googlemail.com>
 yegorslists> all external python packages/libraries should reside in
 yegorslists> "external python modules" section.

 yegorslists> Move existing modules python-serial and python-mad there

 yegorslists> Move python-mad from package/multimedia to package

Committed, thanks. Please consider enabling git's rename detection (-M)
to make such a patch here a lot easier to review.

-- 
Bye, Peter Korsgaard

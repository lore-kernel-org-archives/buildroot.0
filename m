From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Feb 2020 15:47:14 +0100
Subject: [Buildroot] [PATCH 2/2] support/run-tests: check for empty
 sequences in a pythonic way
In-Reply-To: <20200213100906.11506-2-yegorslists@googlemail.com>
 (yegorslists's message of "Thu, 13 Feb 2020 11:09:06 +0100")
References: <20200213100906.11506-1-yegorslists@googlemail.com>
 <20200213100906.11506-2-yegorslists@googlemail.com>
Message-ID: <87a75ifv2l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > According to PEP8 empty sequences should be checked as booleans.

 > Fixes the following PEP8 warning:
 > Do not use `len(SEQUENCE)` to determine if a sequence is empty

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

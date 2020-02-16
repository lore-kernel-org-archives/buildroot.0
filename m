From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Feb 2020 15:39:03 +0100
Subject: [Buildroot] [PATCH 1/2] support/run-tests: reorder imports
In-Reply-To: <20200213100906.11506-1-yegorslists@googlemail.com>
 (yegorslists's message of "Thu, 13 Feb 2020 11:09:05 +0100")
References: <20200213100906.11506-1-yegorslists@googlemail.com>
Message-ID: <87eeuufvg8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > Reorder imports using the isort utility.

Why? Does the current order cause any issues or warnings from linters?

-- 
Bye, Peter Korsgaard

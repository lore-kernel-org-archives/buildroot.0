From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 Jul 2014 16:30:48 +0200
Subject: [Buildroot] [PATCH] zyre: remove spurious dependency on filemq
In-Reply-To: <1404322820-20409-1-git-send-email-spdawson@gmail.com> (Simon
 Dawson's message of "Wed, 2 Jul 2014 18:40:20 +0100")
References: <1404322820-20409-1-git-send-email-spdawson@gmail.com>
Message-ID: <87r4228qg7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Simon" == Simon Dawson <spdawson@gmail.com> writes:

 > zyre doesn't actually depend on filemq; it just needs czmq and zeromq
 > Signed-off-by: Simon Dawson <spdawson@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

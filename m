From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 16 Nov 2012 00:07:21 +0100
Subject: [Buildroot] [PATCH] lcdproc: remove patch rejected upstream
In-Reply-To: <1352720842-5781-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Mon, 12 Nov 2012 11:47:21 +0000")
References: <1352720842-5781-1-git-send-email-spdawson@gmail.com>
Message-ID: <878va21n4m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Remove an lcdproc patch which has been rejected upstream. It has been
 spdawson> decided by lcdproc developer Markus Dolze that the behaviour of the
 spdawson> client_add_key command when handling the minus key is "intentional to
 spdawson> some degree."

 spdawson> This patch also takes the opportunity to remove the version
 spdawson> number from the single remaining lcdproc patch.

Committed, thanks.

-- 
Bye, Peter Korsgaard

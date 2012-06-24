From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Jun 2012 11:13:52 +0200
Subject: [Buildroot] [PATCH 0/7] automatically determine job concurrency
In-Reply-To: <1339466983-19786-1-git-send-email-ntl@pobox.com> (Nathan Lynch's
 message of "Mon, 11 Jun 2012 21:09:36 -0500")
References: <1339466983-19786-1-git-send-email-ntl@pobox.com>
Message-ID: <87obo99inj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nathan" == Nathan Lynch <ntl@pobox.com> writes:

 Nathan> This series implements the option of "autodetecting" the number of
 Nathan> jobs to run concurrently (make -jN), using the number of reported CPUs
 Nathan> when BR2_JLEVEL is set to 0.

Committed series, thanks!

-- 
Bye, Peter Korsgaard

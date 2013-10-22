From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Oct 2013 16:29:36 +0200
Subject: [Buildroot] [PATCH] webkit: fix target install
In-Reply-To: <1382361929-11261-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Mon, 21 Oct 2013 14:25:29 +0100")
References: <1382361929-11261-1-git-send-email-spdawson@gmail.com>
Message-ID: <87r4bdbcq7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 > From: Simon Dawson <spdawson@gmail.com>
 > Commit 33a9d34ff375ec0c0389c9af6bc499a8dd7ccbc9 fixed the staging
 > install for webkit, which was hanging due to deadlock during parallel
 > make install.

 > This problem also afflicts the target install, which is fixed by this patch.

Committed, thanks.

-- 
Bye, Peter Korsgaard

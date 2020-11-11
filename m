From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Nov 2020 11:50:31 +0100
Subject: [Buildroot] [PATCH] support/testing/tests/init/test_systemd:
 update to BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE
In-Reply-To: <20201108205344.3887700-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 8 Nov 2020 21:53:44 +0100")
References: <20201108205344.3887700-1-romain.naour@gmail.com>
Message-ID: <87wnyskw08.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > The commit [1] moved systemd-journal-gatewayd into systemd-journal-remote
 > option. Update to BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE in the testsuite
 > when BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY is used.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/830981805
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/830981811

 > [1] e46fe9a6f2b7cef9789f5172332067cac5ff03bd

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

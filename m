From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 06 Nov 2020 08:13:08 +0100
Subject: [Buildroot] [PATCH] support/testing/tests: fix flake8 warnings
In-Reply-To: <20201105164736.1388901-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 5 Nov 2020 17:47:35 +0100")
References: <20201105164736.1388901-1-thomas.petazzoni@bootlin.com>
Message-ID: <87blgbyn3v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Fixes the following flake8 warnings:
 > support/testing/tests/core/test_selinux.py:21:1: E302 expected 2 blank lines, found 1
 > support/testing/tests/core/test_selinux.py:38:1: E302 expected 2 blank lines, found 1
 > support/testing/tests/core/test_selinux.py:51:1: E302 expected 2 blank lines, found 1
 > support/testing/tests/core/test_selinux.py:62:1: E302 expected 2 blank lines, found 1
 > support/testing/tests/core/test_selinux.py:65:14: E127 continuation line over-indented for visual indent
 > support/testing/tests/init/test_systemd_selinux.py:53:1: E302 expected 2 blank lines, found 1
 > support/testing/tests/init/test_systemd_selinux.py:64:1: E302 expected 2 blank lines, found 1

 > Interestingly, the "continuation line over-indented for visual indent"
 > shows up only once, while the same pattern is there at multiple places
 > in the file. We fix all places with that over-indentation pattern.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 30 Dec 2012 12:29:01 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch e17
In-Reply-To: <cover.1356849033.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Dec 2012 07:31:38 +0100")
References: <cover.1356849033.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87mwwvu6bm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> This set of patches bumps all the EFL (Enlightenment Foundation
 Thomas> Libraries) packages to the latest version 1.7.4 which was released on
 Thomas> December, 21st with E17.

 Thomas> It also adds a package for E17 itself, in order to provide a
 Thomas> demonstration of a lightweight desktop environment in Buildroot.

 Thomas> It has been tested on ARM Glibc (Linaro toolchain) and uClibc
 Thomas> (internal toolchain), booted under X.org in Qemu, and it starts fine.

 Thomas> Of course, some additional improvements and tests can be made
 Thomas> later: test with the XCB backend (only the X11 backend has been
 Thomas> tested), test with the OpenGL backend, test more features, etc.

Pulled, thanks!

-- 
Bye, Peter Korsgaard

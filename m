From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 20 Jan 2013 22:14:55 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch
	yem-instrument-build
In-Reply-To: <cover.1358697765.git.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 20 Jan 2013 17:03:44 +0100")
References: <cover.1358697765.git.yann.morin.1998@free.fr>
Message-ID: <87wqv7blps.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Hello All!

 Yann> This series adds some intrumentation to the pkg-infra so that it
 Yann> is easier for the autobuilders to extract meaningfull information
 Yann> about the reason of failures.

Committed patch 1-5, thanks!

 Yann> Yann E. MORIN (7):
 Yann>       toolchain/external: sprinkle with some calls to MESSAGE
 Yann>       toolchain/crosstool-ng: sprinkle with some calls to MESSAGE
 Yann>       toolchain/gcc: sprinkle with some calls to MESSAGE
 Yann>       toolchain/kernel-headers: sprinkle with some calls to MESSAGE
 Yann>       toolchain/uClibc: sprinkle with some calls to MESSAGE
 Yann>       fs/common.mk: delay evaluation of variables.
 Yann>       pkg-infra: log current message

-- 
Bye, Peter Korsgaard

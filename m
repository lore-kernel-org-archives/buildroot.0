From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Nov 2013 00:41:28 +0100
Subject: [Buildroot] [PATCH] util-linux: disable fallocate for avr32
In-Reply-To: <1383472585-1876-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Sun, 3 Nov 2013 09:56:25 +0000")
References: <1383472585-1876-1-git-send-email-spdawson@gmail.com>
Message-ID: <87li0vakpj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

> From: Simon Dawson <spdawson@gmail.com>
> The fallocate syscall is not implemented in the avr32 toolchain.

> Fixes build failures such as the following.

>   http://autobuild.buildroot.net/results/bc4/bc41a3fea20181526eb247ac910244aa2aa4c4c0/

Committed, thanks.

-- 
Bye, Peter Korsgaard

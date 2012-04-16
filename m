From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Apr 2012 22:34:27 +0200
Subject: [Buildroot] [PATCH] boost: pass -dumpversion to user-config.jam
In-Reply-To: <1334581615-27627-1-git-send-email-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Mon, 16 Apr 2012 15:06:55
 +0200")
References: <1334581615-27627-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <87vckz8lgs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 yegorslists> From: Yegor Yefremov <yegorslists@googlemail.com>
 yegorslists> Short version avoids compiling problems with toolchains
 yegorslists> containing long version string like Linaro toolchain.

Committed, but I dropped the head / sed invocations as -dumpversion
directly provides the version number.

-- 
Bye, Peter Korsgaard

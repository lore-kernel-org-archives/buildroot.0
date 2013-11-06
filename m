From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Nov 2013 22:52:55 +0100
Subject: [Buildroot] [PATCH v2] libevas: disable on avr32
In-Reply-To: <1383746180-14202-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Wed, 6 Nov 2013 13:56:20 +0000")
References: <1383746180-14202-1-git-send-email-spdawson@gmail.com>
Message-ID: <8761s5kxjc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 > From: Simon Dawson <spdawson@gmail.com>
 > Neither epoll_create1 nor inotify_init1 is available on avr32. Fixes build
 > failures such as the following.

 >   http://autobuild.buildroot.net/results/4d435a5fc608936362d605aca696c01023be9723

Committed, thanks.

-- 
Bye, Peter Korsgaard

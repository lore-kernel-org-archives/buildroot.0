From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Nov 2013 00:54:54 +0100
Subject: [Buildroot] [PATCH] wayland: disable on avr32
In-Reply-To: <1384595893-15468-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Sat, 16 Nov 2013 09:58:13 +0000")
References: <1384595893-15468-1-git-send-email-spdawson@gmail.com>
Message-ID: <87r4afzyup.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 > From: Simon Dawson <spdawson@gmail.com>
 > The epoll_create1, timerfd_create and timerfd_settime syscalls are not available
 > on avr32. Fixes build failures such as the following.

 >   http://autobuild.buildroot.net/results/43b/43b3df5978782034279604abde8fe5d46c441344/

Committed, thanks.

-- 
Bye, Peter Korsgaard

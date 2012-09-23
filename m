From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 23 Sep 2012 21:29:41 +0200
Subject: [Buildroot] [PATCH v2] xserver_xorg-server: fix dbus/udev
	configure problem
In-Reply-To: <1348402700-12259-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Sun, 23 Sep 2012 13:18:20 +0100")
References: <1348402700-12259-1-git-send-email-spdawson@gmail.com>
Message-ID: <87obkw8rmi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>

 spdawson> If both the dbus and udev packages are selected, then the
 spdawson> configure step for the xserver_xorg-server package fails as
 spdawson> follows.

Committed, thanks.

-- 
Bye, Peter Korsgaard

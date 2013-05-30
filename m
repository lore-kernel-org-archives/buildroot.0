From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 30 May 2013 16:06:27 +0200
Subject: [Buildroot] [PATCH] system/device-table: do not set
	/home/default stgid
In-Reply-To: <1369514012-19606-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 25 May 2013 22:33:32 +0200")
References: <1369514012-19606-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <8761y01s0s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> Currently, /home/default is mode 2755 which means it is setgid.
 Yann> Since /home/default is not group-writable, it is useless.

Committed to next, thanks.
-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 20 Sep 2010 09:22:13 +0200
Subject: [Buildroot] [PATCH 2/3] zlib: Fix build
In-Reply-To: <1284812207-31798-3-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Sat, 18 Sep 2010 14:16:46 +0200")
References: <1284812207-31798-1-git-send-email-llandwerlin@gmail.com>
	<1284812207-31798-3-git-send-email-llandwerlin@gmail.com>
Message-ID: <871v8o517e.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> Using "make -j $(N)" with N > 1 break zlib build.

Strangely enough I saw it as well this morning - Committed, thanks!

-- 
Bye, Peter Korsgaard

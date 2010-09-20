From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 20 Sep 2010 16:31:42 +0200
Subject: [Buildroot] [PATCH] Fix <PKG_NAME>_VERSION variable setup
In-Reply-To: <1284852075-17257-1-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Sun, 19 Sep 2010 01:21:15 +0200")
References: <1284852075-17257-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <87aanc32r5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> Commit 993e51bc22f508fbaf39c5c49fd0595fc5c56013 introduced a problem
 llandwerlin> to compute <PKG_NAME>_VERSION variable when PKG_NAME start with
 llandwerlin> 'HOST_'.

Committed, thanks.

-- 
Bye, Peter Korsgaard

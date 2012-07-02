From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Jul 2012 20:54:08 +0200
Subject: [Buildroot] [PATCH 1/2] Revert "dependencies: ensure that
	DESTDIR isn't set when running Buildroot"
In-Reply-To: <1341238874-1309-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 2 Jul 2012 16:21:13 +0200")
References: <1341238874-1309-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zk7i0zan.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> We should instead simply unset it at runtime, like we do for
 Thomas> PKG_CONFIG_PATH.

Committed both, thanks.

-- 
Bye, Peter Korsgaard

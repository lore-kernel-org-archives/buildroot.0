From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Sep 2012 15:32:06 +0200
Subject: [Buildroot] [PATCH] fbdump: only build VGA16 support on
	x86/x86-64
In-Reply-To: <1347998613-16861-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 18 Sep 2012 22:03:33 +0200")
References: <1347998613-16861-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zk4k95wp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The VGA16 dumping feature probably doesn't make much sense on anything
 Thomas> else than x86 and x86-64, as it is accessing I/O ports that seem
 Thomas> PC-specific.

Committed, thanks.

-- 
Bye, Peter Korsgaard

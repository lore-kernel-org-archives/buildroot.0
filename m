From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 May 2013 23:55:30 +0200
Subject: [Buildroot] [PATCH 04/20] gcc: fix gcc 4.8 build when thread
	support is disabled
In-Reply-To: <1369606110-8088-5-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 27 May 2013 00:08:14 +0200")
References: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369606110-8088-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87hahocckt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> When thread support is disabled, the libitm and libatomic libraries
 Thomas> from gcc should be disabled, otherwise, the build of gcc fails.

I've added this for 2013.05 instead, thanks.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 16 Sep 2012 23:25:15 +0200
Subject: [Buildroot] [PATCH] erlang: don't build the Java stuff on the
	host
In-Reply-To: <1347828062-24022-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 16 Sep 2012 22:41:02 +0200")
References: <1347828062-24022-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vcfdoe2s.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> We don't need the Java stuff, and it causes build failures on certain
 Thomas> machines:

 Thomas>  http://autobuild.buildroot.org/results/99035e89e101c41d5e8b5ef6a025856f4af88ae2/build-end.log

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 Feb 2012 10:08:15 +0100
Subject: [Buildroot] [PATCH 1/1] libecore: fix build of host-libecore
	when X11 not available
In-Reply-To: <0d07a1bdbd78622e222cb06ddfd0a8bb43d63bef.1330468539.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 28 Feb 2012 23:35:48 +0100")
References: <cover.1330468539.git.thomas.petazzoni@free-electrons.com>
 <cover.1330468539.git.thomas.petazzoni@free-electrons.com>
 <0d07a1bdbd78622e222cb06ddfd0a8bb43d63bef.1330468539.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87y5rmc8hs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The host-libecore build tries to build the X11 backend. This works if
 Thomas> you have X11 headers/libraries installed on your build machine, but
 Thomas> fails if you don't, and Buildroot shouldn't depend on such things
 Thomas> being installed.

Committed, thanks.

-- 
Bye, Peter Korsgaard

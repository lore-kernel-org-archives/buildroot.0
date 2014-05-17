From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 May 2014 23:27:47 +0200
Subject: [Buildroot] [PATCH] fluxbox: uses fork(),
	not available on noMMU platforms
In-Reply-To: <1400336302-8774-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 17 May 2014 16:18:22 +0200")
References: <1400336302-8774-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87tx8om6y4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > fluxbox uses the fork() system call, not available on noMMU
 > platforms. It's always fairly unlikely to have to use a full-blown
 > X.org window manager on such platforms.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

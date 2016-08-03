From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Aug 2016 22:53:10 +0200
Subject: [Buildroot] [PATCH 2/2] ncurses: use foreach make loops instead
	of shell for loops
In-Reply-To: <1470170076-28901-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 2 Aug 2016 22:34:36 +0200")
References: <1470170076-28901-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1470170076-28901-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87eg65h8w9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The main benefit of using make foreach loops is that they will abort
 > if one of the iteration of the loop fails. The current for loops will
 > continue, and only report a failure if the last iteration was a
 > failure, but will silently ignore other errors.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

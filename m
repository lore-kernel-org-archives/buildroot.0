From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Aug 2016 22:53:05 +0200
Subject: [Buildroot] [PATCH 1/2] ncurses: factorize terminfo files
	installation
In-Reply-To: <1470170076-28901-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 2 Aug 2016 22:34:35 +0200")
References: <1470170076-28901-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87invhh8we.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This long list of commands to copy the terminfo files from staging to
 > target is really silly and can be factorized using a
 > NCURSES_TERMINFO_FILES variable, which is then iterated through.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

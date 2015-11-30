From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Nov 2015 17:08:27 +0100
Subject: [Buildroot] [PATCH] valgrind: add a patch to fix MIPS R6 by
	replacing ADDI with ADDIU
In-Reply-To: <1448886346-62868-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Mon, 30 Nov 2015 12:25:46 +0000")
References: <1448886346-62868-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87vb8jlbb8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > The ADDI instruction has been removed for MIPS R6, so valgrind fails to
 > build for this revision level because it uses that assembly
 > instruction. Using ADDIU instead fixes the problem.

 > The patch has been sent upstream:

 >   https://bugs.kde.org/show_bug.cgi?id=356112

 > Fixes:

 >   http://autobuild.buildroot.net/results/488/488937704b3b6bae8daed7b24da8c740b56f4d84/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

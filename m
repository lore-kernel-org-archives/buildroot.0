From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Jul 2017 17:14:07 +0200
Subject: [Buildroot] [PATCH] trinity: fix MIPS support
In-Reply-To: <1498803119-28740-1-git-send-email-marcin.nowakowski@imgtec.com>
 (Marcin Nowakowski's message of "Fri, 30 Jun 2017 08:11:59 +0200")
References: <1498803119-28740-1-git-send-email-marcin.nowakowski@imgtec.com>
Message-ID: <8760fac1mo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcin" == Marcin Nowakowski <marcin.nowakowski@imgtec.com> writes:

 > Add an upstream patch that fixes segfaults when executed on MIPS due to
 > incorrect handling of system call numbers on MIPS platforms.

 > Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
 > Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed to 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard

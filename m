From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 Mar 2014 12:51:56 +0100
Subject: [Buildroot] [PATCH v4] Disable o32 ABI for MIPS64 architectures
In-Reply-To: <1396004452-28983-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Fri, 28 Mar 2014 11:00:52 +0000")
References: <1396004452-28983-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87ioqyfsmb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Building o32 ELF files for MIPS64 is an exotic configuration that nobody
 > should be using. If o32 is required, then is better if it's built for
 > MIPS 32-bit cores so only 32-bit instructions will be used leading to a
 > more efficient o32 usage.

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

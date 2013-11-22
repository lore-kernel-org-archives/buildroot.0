From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 22 Nov 2013 15:58:34 +0100
Subject: [Buildroot] [PATCH v3] tinymembench: package not supported on
	MIPS64
In-Reply-To: <1385117836-26855-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Fri, 22 Nov 2013 10:57:16 +0000")
References: <1385117836-26855-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <877gc0pjol.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Fixes:
 >    http://autobuild.buildroot.net/results/bab/bab68bcf8714f215ac0b0c2546fa06608377fbb0/

 > This package is only supported on MIPS32 platforms. The mips-32.S
 > file included in the source code of this package only makes sense to
 > be compiled for MIPS32, and also contains hardcoded MIPS32
 > instructions which are illegal on MIPS64.  Trying to compile this
 > package on a MIPS64 platform will end with a linkage failure due to
 > undefined references.

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

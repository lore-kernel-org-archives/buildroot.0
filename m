From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Nov 2015 13:22:45 +0100
Subject: [Buildroot] [PATCH] polarssl: disable assembly for MIPS R6
In-Reply-To: <1448620638-44691-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Fri, 27 Nov 2015 10:37:18 +0000")
References: <1448620638-44691-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87fuzrskbu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Is not yet supported and the compilation will fail like this:
 > [  4%] Building C object library/CMakeFiles/polarssl.dir/bignum.c.o
 > /tmp/ccLDxl9G.s: Assembler messages:
 > /tmp/ccLDxl9G.s:92: Error: opcode not supported on this processor:
 > mips32r6 (mips32r6) `multu $13,$14'
 > /tmp/ccLDxl9G.s:93: Error: opcode not supported on this processor:
 > mips32r6 (mips32r6) `addi $10,$10,4'
 > /tmp/ccLDxl9G.s:94: Error: opcode not supported on this processor:
 > mips32r6 (mips32r6) `mflo $14'
 > /tmp/ccLDxl9G.s:95: Error: opcode not supported on this processor:
 > mips32r6 (mips32r6) `mfhi $9'

 > [...]

Committed after adding an autobuilder reference, thanks.

-- 
Bye, Peter Korsgaard

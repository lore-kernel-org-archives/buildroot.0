From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 27 Nov 2015 13:04:00 +0000
Subject: [Buildroot] [PATCH] polarssl: disable assembly for MIPS R6
In-Reply-To: <87fuzrskbu.fsf@dell.be.48ers.dk>
References: <1448620638-44691-1-git-send-email-Vincent.Riera@imgtec.com>
 <87fuzrskbu.fsf@dell.be.48ers.dk>
Message-ID: <565854C0.1090508@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 27/11/15 12:22, Peter Korsgaard wrote:
>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
> 
>  > Is not yet supported and the compilation will fail like this:
>  > [  4%] Building C object library/CMakeFiles/polarssl.dir/bignum.c.o
>  > /tmp/ccLDxl9G.s: Assembler messages:
>  > /tmp/ccLDxl9G.s:92: Error: opcode not supported on this processor:
>  > mips32r6 (mips32r6) `multu $13,$14'
>  > /tmp/ccLDxl9G.s:93: Error: opcode not supported on this processor:
>  > mips32r6 (mips32r6) `addi $10,$10,4'
>  > /tmp/ccLDxl9G.s:94: Error: opcode not supported on this processor:
>  > mips32r6 (mips32r6) `mflo $14'
>  > /tmp/ccLDxl9G.s:95: Error: opcode not supported on this processor:
>  > mips32r6 (mips32r6) `mfhi $9'
> 
>  > [...]
> 
> Committed after adding an autobuilder reference, thanks.

Where did you get that autobuilder reference from?

Regards,

Vincent.

From: Steven J. Hill <sjhill@realitydiluted.com>
Date: Thu, 1 Nov 2007 12:40:06 -0500
Subject: [Buildroot] NPTL support for uClibc-0.9.28
In-Reply-To: <297299.44939.qm@web7902.mail.in.yahoo.com>
References: <297299.44939.qm@web7902.mail.in.yahoo.com>
Message-ID: <20071101174006.GA9683@real.realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>    I am using buildroot to build cross toolchain for MIPS processor ( binutils 2.15,  gcc 3.4.3, uClibc-0.9.28 and Linux 2.6.18 kernel) .
>    
Nope. You will need gcc-4.2 or better and uClibc-0.9.29 from the
uClibc-NPTL branch in Subversion and binutils-2.17 or better.

>   Can i get Native POSIX Threading (NPTL) support if i use above versions of binutils-2.15,gcc-3.4.3,uClibc-0.9.28 and Linux 2.6.18 kernel by enabling the  "Enable Native POSIX Threading (NPTL) support?"
>   in the buildroot Toolchain Options.
>    

>    Also does uClibc-0.9.28   support Native POSIX Threading (NPTL)?
>    
No, and it never will.

>   If not what are the suggested versions of binutils,uClibc and gcc to be used to  get NPTL support for MIPS cross toolchain. 
>    
binutils-2.17.60.0.16
gcc-4.2.0
uClibc-NPTL

Honestly everyone, I am clearing my schedule to do the NPTL merge and
get SuperH, ARM and MIPS all with NPTL support into trunk.

-Steve

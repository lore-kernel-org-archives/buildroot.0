From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 Oct 2013 21:12:01 +0200
Subject: [Buildroot] [PATCH] ndisc6: needs mmu
In-Reply-To: <1380964029.3121.0.camel@phoenix> (Axel Lin's message of "Sat, 05
 Oct 2013 17:07:09 +0800")
References: <1380964029.3121.0.camel@phoenix>
Message-ID: <87wqlrh6ri.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:

 Axel> Fix below build error if !BR2_USE_MMU:
 Axel> tcpspray.o: In function `tcpspray':
 Axel> tcpspray.c:(.text+0x4a8): undefined reference to `fork'
 Axel> collect2: ld returned 1 exit status
 Axel> make[3]: *** [tcpspray] Error 1

Committed, thanks.

-- 
Bye, Peter Korsgaard

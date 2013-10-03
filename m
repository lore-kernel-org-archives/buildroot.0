From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 Oct 2013 08:48:13 +0200
Subject: [Buildroot] [PATCH] zsh: needs mmu
In-Reply-To: <1380763207.1614.1.camel@phoenix> (Axel Lin's message of "Thu, 03
 Oct 2013 09:20:07 +0800")
References: <1380763207.1614.1.camel@phoenix>
Message-ID: <87li2aono2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:

 Axel> Fix below build error if !BR2_USE_MMU:
 Axel> exec.o: In function `zfork':
 Axel> exec.c:(.text+0x150c): undefined reference to `fork'
 Axel> collect2: ld returned 1 exit status
 Axel> make[2]: *** [zsh] Error 1

 Axel> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

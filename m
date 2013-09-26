From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Sep 2013 16:50:37 +0200
Subject: [Buildroot] [PATCH] socat: needs mmu
In-Reply-To: <1380160493.18654.0.camel@phoenix> (Axel Lin's message of "Thu,
 26 Sep 2013 09:54:53 +0800")
References: <1380160493.18654.0.camel@phoenix>
Message-ID: <87mwmz7i2q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:

 Axel> Signed-off-by: Axel Lin <axel.lin@ingics.com>
 Axel> ---
 Axel> Fix below build error:

 Axel> sycls.o: In sycls.ofunction `: Fork'In:
 Axel> sycls.c :function (.text`Fork+0x16d0':): undefined
 Axel>  referencesycls.c to `fork'
 Axel> collect2: ld returned 1 exit status:
 Axel> (.text+0x16d0): undefined reference to `fork'
 Axel> collect2: ld returned 1 exit status
 Axel> make[1]: *** [procan] Error 1
 Axel> make[1]: *** Waiting for unfinished jobs....
 Axel> make[1]: *** [filan] Error 1

Committed, thanks.

-- 
Bye, Peter Korsgaard

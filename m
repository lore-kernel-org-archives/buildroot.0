From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 02 Oct 2013 09:34:30 +0200
Subject: [Buildroot] [PATCH 1/3] nfs-utils: needs mmu
In-Reply-To: <1380692976.31880.0.camel@phoenix> (Axel Lin's message of "Wed,
 02 Oct 2013 13:49:36 +0800")
References: <1380692976.31880.0.camel@phoenix>
Message-ID: <87li2crurd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:

 Axel> Fix below build error:
 Axel> mountd-mountd.o: In function `main':
 Axel> mountd.c:(.text+0x1264): undefined reference to `fork'
 Axel> mountd.c:(.text+0x1320): undefined reference to `fork'
 Axel> mountd-rmtab.o: In function `ha_callout':
 Axel> rmtab.c:(.text+0xa8): undefined reference to `fork'
 Axel> collect2: ld returned 1 exit status
 Axel> make[3]: *** [mountd] Error 1

Committed, thanks.

-- 
Bye, Peter Korsgaard

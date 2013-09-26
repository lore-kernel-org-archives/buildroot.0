From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Sep 2013 16:50:55 +0200
Subject: [Buildroot] [PATCH] logsurfer: needs mmu
In-Reply-To: <1380161860.11201.1.camel@phoenix> (Axel Lin's message of "Thu,
 26 Sep 2013 10:17:40 +0800")
References: <1380161860.11201.1.camel@phoenix>
Message-ID: <87ioxn7i28.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:

 Axel> Signed-off-by: Axel Lin <axel.lin@ingics.com>
 Axel> ---
 Axel> Fix below build error:

 Axel> exec.o: In function `do_exec':
 Axel> exec.c:(.text+0x14c): undefined reference to `fork'
 Axel> exec.o: In function `do_pipe_line':
 Axel> exec.c:(.text+0x218): undefined reference to `fork'
 Axel> logsurfer.o: In function `runasdaemon':
 Axel> logsurfer.c:(.text+0x388): undefined reference to `fork'
 Axel> logsurfer.c:(.text+0x3dc): undefined reference to `fork'
 Axel> report.o: In function `make_report':
 Axel> report.c:(.text+0x1a8): undefined reference to `fork'
 Axel> collect2: ld returned 1 exit status
 Axel> make[2]: *** [logsurfer] Error 1
 Axel> make[2]: Leaving directory `/opt/test/buildroot/buildroot/output/build/logsurfer-1.8/src'
 Axel> make[1]: *** [all] Error 2
 Axel> make[1]: Leaving directory `/opt/test/buildroot/buildroot/output/build/logsurfer-1.8'

Committed, thanks.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 May 2014 16:28:25 +0200
Subject: [Buildroot] [PATCH 1/1] qemu x86/x86_64: Add kernel IPC support
In-Reply-To: <1398365260-1595-1-git-send-email-martin@barkynet.com> (Martin
 Bark's message of "Thu, 24 Apr 2014 19:47:40 +0100")
References: <1398365260-1595-1-git-send-email-martin@barkynet.com>
Message-ID: <87eh039gc6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:

 > The alsa utils packages require a kernel with IPC support to run.  The
 > kernel config for the x86 and x86_64 qemu build includes sound support
 > using the hda driver but without the IPC support the alsa utils won't work.
 > This patch adds IPC support to the x86 and x86_64 kernel to allow alsa
 > utils to run and brings the kernel config inline with kernel configs for
 > other qemu boards.

 > Signed-off-by: Martin Bark <martin@barkynet.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 23 Jun 2009 18:19:14 +0000 (UTC)
Subject: [Buildroot] Can't debug threaded app on ARM920 (SIG32)
References: <h1obk9$cnn$2@ger.gmane.org>
Message-ID: <h1r6b2$kd5$2@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2009-06-22, Grant Edwards <grant.b.edwards@gmail.com> wrote:

> I'm trying to debug a threaded application using gdbserver on
> an ARM920T platform (Atmel AT91RM9200 eval board), and I'm not
> having much luck.  Whenver a new thread is started, I see a
> SIG32:

Gdb 6.8 is broken for ARM targets.  6.7.1 works fine.

-- 
Grant Edwards                   grante             Yow! Did YOU find a
                                  at               DIGITAL WATCH in YOUR box
                               visi.com            of VELVEETA?

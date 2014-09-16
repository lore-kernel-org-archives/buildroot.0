From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Sep 2014 22:14:24 +0200
Subject: [Buildroot] General questions
In-Reply-To: <CAK9TtU0uPXcqZNEcgxjrs_Gnm=jMECRPDAbKMAjoCTxC-Ycb2g@mail.gmail.com>
References: <CAK9TtU0uPXcqZNEcgxjrs_Gnm=jMECRPDAbKMAjoCTxC-Ycb2g@mail.gmail.com>
Message-ID: <20140916221424.3d28aa8c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sylvain LG,

On Tue, 9 Sep 2014 11:20:13 +0200, Sylvain LG wrote:

> I develop some projects with Qt and run them on ARM embedded systems. OS is
> built by Buildroot.
> 
> Since Qt 5.3.1 and QtCreator 3, GDB must support Python scripting.
> 
> ?The selected build of GDB does not support Python scripting it cannot be
> used in Qt Creator?
> 
> 
> I have to recompile gdb with these options:
> 
> ./configure --prefix /usr/local/gdb-python2 --with-python
> 
> What is the right way to achieve this?
> 
> Could someone give me the guideline to contribute to Buildroot?

FWIW, I've sent a patch series at
http://lists.busybox.net/pipermail/buildroot/2014-September/106205.html
that provides Python support for both the host gdb and target gdb.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

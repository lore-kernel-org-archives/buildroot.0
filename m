From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 10:58:56 +0200
Subject: [Buildroot] [PATCH 2/5] perl-io-socket-ssl: new package
In-Reply-To: <CAB0FRsuBn+GbC1qW-kke6UCcNkzZCyppa9P1F94vnpLYe_dwag@mail.gmail.com>
References: <1405614782-3667-1-git-send-email-francois.perrad@gadz.org>
 <1405614782-3667-2-git-send-email-francois.perrad@gadz.org>
 <20140717230821.6e188178@free-electrons.com>
 <CAB0FRsufdYwK19vZwrQn32hnSfyGH=4xK1c1itsVbPqhK3xQ2Q@mail.gmail.com>
 <20140719003837.252c0234@free-electrons.com>
 <CAB0FRsuBn+GbC1qW-kke6UCcNkzZCyppa9P1F94vnpLYe_dwag@mail.gmail.com>
Message-ID: <20140719105856.7e125fda@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fran?ois Perrad,

On Sat, 19 Jul 2014 09:15:58 +0200, Fran?ois Perrad wrote:

> > But again, with the new perl packages just merged:
> >
> >  http://autobuild.buildroot.org/results/6a8/6a89ac18c44490fd25792c39286acbf6c4830e60/build-end.log
> >  http://autobuild.buildroot.org/results/c80/c80d549e38bfa15e19bec7ef226c0120d4adb6ab/build-end.log
> >  http://autobuild.buildroot.org/results/bee/bee5add7dad08a573cad2aa1f438625b135551dd/build-end.log
> >
> > Wouldn't it be possible to find a more reliable CPAN mirror to use as
> > the default?
> 
> There are 258 mirrors, see http://www.cpan.org/SITES.html
> and their status are tracked by http://mirrors.cpan.org/

Could you select one that apparently works well, and propose a patch to
use it as the default?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

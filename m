From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 25 Sep 2016 23:31:38 +0200
Subject: [Buildroot] Error wget
In-Reply-To: <CAHyxmEiFpOw6GDZKYOu9_ZSZd2jsQ8i=QP_-vFEHkobJw8kYuA@mail.gmail.com>
References: <CAHyxmEiFpOw6GDZKYOu9_ZSZd2jsQ8i=QP_-vFEHkobJw8kYuA@mail.gmail.com>
Message-ID: <20160925233138.14a0105b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marco,

On Fri, 23 Sep 2016 18:21:20 +0200, Marco Rosario Martino <marcorosm96@gmail.com> wrote:

> Hi,
> I'd make an .img for my raspberry pi.
> In buildroot folder I did the command : make raspberrypi_defconfig and then
> the command: make all,but I received this error : wget --passive-ftp -nd -t
> 3 -O
> '/home/marcorm96/buildroot-2016.08.1/output/build/.binutils-2.25.1.tar.bz2.kixqzn/output'
> 'http://sources.buildroot.net/binutils-2.25.1.tar.bz2'
> 
> I'm using Linux Mint 18 64 bit
> 
> Thanks


Your (shown) 'make all' log is missing the error message...

Normally a buildroot build starts with downloading the source for each package before
compiling..., I would suspect some network problem in case every download is failing...

Regards,
Peter

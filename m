From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 17 Oct 2019 00:01:08 +0200
Subject: [Buildroot] Openblas required at menu config file
In-Reply-To: <CAKBF_5r5-qDKTFtCEctOdAekC1Wfvx0W-NmyUyKkmZS7=3mgew@mail.gmail.com>
References: <CAKBF_5qLpyXbwmspV7gn0zjBXfThnSvZEyjMqCHdR=3qHytmwg@mail.gmail.com>
 <20191015085013.33c52908@gmx.net>
 <CAKBF_5r5-qDKTFtCEctOdAekC1Wfvx0W-NmyUyKkmZS7=3mgew@mail.gmail.com>
Message-ID: <20191017000108.6c6602e9@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Billa,

On Tue, 15 Oct 2019 14:01:42 +0530, Billa Surendra <billa.iitmadras@gmail.com> wrote:

> Thank you so much for your response

Searching for openblas and riscv gives 'Add support for RISC-V #1526' ([1]),
basic support (non optimized) is on the way...

Regards,
Peter

[1] https://github.com/xianyi/OpenBLAS/pull/1526

>
> On Tue, Oct 15, 2019 at 12:20 PM Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Hello Billa,
> >
> > On Tue, 15 Oct 2019 10:24:23 +0530, Billa Surendra <
> > billa.iitmadras at gmail.com> wrote:
> >
> > > Dear All,
> > >
> > > I have downloaded buildroot-2019.02.6 and I did $make menuconfig, In
> > this I
> > > am unable to find Openblas under* target library --> others*. Please
> > > suggest me what to do for getting openblas package in drop down menu. I
> > > want openblas library support in buildroot for running HPL in RISC-V
> > > architecture board.
> >
> > After a quick look at package/openblas/Config.in I believe openblas
> > is not (yet) supported for your architecture (riscv) (see
> > BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS logic), packages not supported
> > for an selected architecture are not shown in menuconfig...
> >
> > If openblas supports riscv feel free to send a patch to enable it
> > for buildroot ;-)
> >
> > Regards,
> > Peter
> >
> > >
> > > Thanks in advance
> > > Billa Surendra
> >
> >

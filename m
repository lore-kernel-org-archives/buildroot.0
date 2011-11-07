From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 7 Nov 2011 10:07:23 +0100
Subject: [Buildroot] QT support for Buildroot RFS.
In-Reply-To: <1F383CDA589639468828C7E2B75EDE9D0602B149@POCITMSEXMB02.LntUniverse.com>
References: <1F383CDA589639468828C7E2B75EDE9D06029498@POCITMSEXMB02.LntUniverse.com>
 <1F383CDA589639468828C7E2B75EDE9D0602B149@POCITMSEXMB02.LntUniverse.com>
Message-ID: <CAGm1_ks4qcMAV7gPyq4odX4ub+RXnh=BmhrU4zzdU4_BQ+m0oA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 7, 2011 at 9:16 AM, Mahanteshwari Hiremath
<Mahanteshwari.Hiremath@lnties.com> wrote:
> Hi,
> ????????? I am trying to buid buildroot RFS with QT supprt.
> I have enabled C++ support in toolchain and Qt support in package selection
> --> Graphic libraries --> Qt.
> after 'make'? I can see qmake getting installed in staging/usr/bin.
>
> What are the necessary changes(settings) i have to do inorder to get qmake
> installed in target/bin and libraries in target/lib(nothing but RFS).

What are you going to do? Are you going to compile the final program
on your target device directly? What is the problem with
cross-compiling?

Yegor

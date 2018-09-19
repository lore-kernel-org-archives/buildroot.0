From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 19 Sep 2018 21:14:29 +0200
Subject: [Buildroot] Problems with the package wget version 1.19.5
In-Reply-To: <CALtfCQbUb2Fg+ofRkupgPKmgcs3DLmna2W9NSR-H5tpVgLKQ1A@mail.gmail.com>
References: <CALtfCQbUb2Fg+ofRkupgPKmgcs3DLmna2W9NSR-H5tpVgLKQ1A@mail.gmail.com>
Message-ID: <20180919211429.3fe184ef@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Oscar,

On Wed, 19 Sep 2018 10:09:17 +0200, Oscar Gomez Fuente <oscargomezf@gmail.com> wrote:

> Hi everyone,
> 
> I had a problem with the package wget. The compilation was successful,
> but when I executed on my HW platform (Raspberry Pi 3B+), I've got a
> segmentation fault.
> 
> I using Buildroot 2018.02.5 and the version of the package wget is:
> 
> WGET_VERSION = 1.19.5
> 
> Could anyone check if this package is working fine?

Please post your .config/defconfig file (with the bare raspberrypi3_defconfig
wget is disabled because of the BR2_USE_WCHAR dependency (and BR2_PACKAGE_BUSYBOX_SHOW_OTHERS))?

Did you try a complete rebuild after changing your configuration (see [1])?

Regards,
Peter

[1] http://nightly.buildroot.org/manual.html#full-rebuild

> 
> Best regards.
> 
> Oscar Gomez Fuente
> TST Sistemas
> www.tst-sistemas.es
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

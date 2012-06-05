From: Jeff Renner <d1g1t4lsh4d0w@gmail.com>
Date: Tue, 5 Jun 2012 15:25:50 +0100
Subject: [Buildroot] TCL - development.
Message-ID: <CAMPueyx4TWzcFze_LwSX-709Z0H-0+bw=UGqr-4_k7yfdPiV6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm trying to compile a selfmade package for OASYS
(http://sourceforge.net/projects/dtn/files/oasys/oasys-1.5.0/), and
I'm using autotools.
The OASYS depends on TCL-devel.

When I try to compile that package, I have this error:
configure: error: Please install the tcl development files headers and
libraries. Can't find usable tcl.h
 have the Buildroot TCL package compiled.. So I assume that, the
Buildroot TCL package is not enough for OASYS compilation, right?

Also, I tryied add : --with-tcl=$(BUILD_DIR)/tcl-8.4.19/generic to the
OASYS_CONF_OPT = in oasys.mk but seems not work.

Someone can help ?

Thanks a lot,

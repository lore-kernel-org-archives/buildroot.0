From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Dec 2019 13:20:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/libftdi1: fix license
In-Reply-To: <20191124180157.32084-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 24 Nov 2019 19:01:57 +0100")
References: <20191124180157.32084-1-fontaine.fabrice@gmail.com>
Message-ID: <87tv6hmwgq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > The GPL only applies to the C++ bindings, which are conditionally
 > enabled with BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1.

 > The COPYING.LIB is indeed the LGPL-2.0, but the source file for
 > libftdi1 states LGPL-2.1-only, see src/ftdi.c

 > The src/ftdi_stream.c also bears a notice of the MIT license, so the
 > library itself is under both LGPL-2.1-only and MIT.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard

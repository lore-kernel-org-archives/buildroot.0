From: Michael Stieler <michael.stieler@rie.eu>
Date: Thu, 25 Oct 2012 19:42:26 +0200
Subject: [Buildroot] buildroot for AM3358 AM3359 with wireless-tools shared
	library
Message-ID: <50897A02.7000407@rie.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,

we are using buildroot for arm development. we are migrating from 
arm926t to AM3358 and AM3359.

i was hoping to continue to use buildroot for the processors, but i 
cannot build the right compiler for these 2.

in make menuconfig i choose:

target architecture ARM (big endian)
target architecture variant cortex-a8        # for sitara am3358 cortex a8 ?
toolchain ->  Kernel headers 3.2.x
package selection for target -> network applications --> X wireless 
tools --> X install shared library

i need the wireless tools library. liw

any suggestions ?

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Apr 2010 17:10:49 +0200
Subject: [Buildroot] Which commercial products use buildroot?
In-Reply-To: <w2k2facd6dc1004110431idf465b71za05aef84eed86ad4@mail.gmail.com>
References: <w2k2facd6dc1004110431idf465b71za05aef84eed86ad4@mail.gmail.com>
Message-ID: <20100412171049.36b7c899@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 11 Apr 2010 12:31:59 +0100
Tom Parkin <tom.parkin@gmail.com> wrote:

> I'm doing some research into embedded Linux distributions as a
> background to an article I'm planning on the various embedded distros
> and their areas of application. Particularly, I'm interested in
> finding out about any commercial products which have used a particular
> distribution in their software stack -- I think such examples will
> help give my audience something extra to relate to, particularly if
> they are widely known examples.
> 
> As such, I was wondering whether you know of any products which use
> buildroot?

Atmel is using Buildroot as one component of the official BSP for their
AT91 evaluation boards :
 http://www.at91.com/linux4sam/bin/view/Linux4SAM/BuildRoot
 (but the version they are using is very, very old)

Atmel is also using Buildroot for their AVR32 evaluation boards :
 http://www.atmel.no/buildroot/

Calao Systems <http://www.calao-systems.com> (maker of AT91-based
boards and soon OMAP3530-based boards) is using Buildroot for their
boards as well.

Armadeus <http://www.armadeus.org> (maker of Freescale iMX-based
boards, coming with a FPGA) is using Buildroot for their boards.

Tensilica, makers of the Xtensa CPU architecture, is also using
Buildroot, see http://wiki.linux-xtensa.org/index.php/Main_Page and
http://wiki.linux-xtensa.org/index.php/Buildroot_Build_Instructions.

Simtec (http://www.simtec.co.uk/products/SWBUILDROOT/) seems to also be
using Buildroot.

And then there are lots of companies using Buildroot to generate their
embedded Linux system, but do not say publicly anything about this. For
example, several of our customers do use Buildroot for things like
digital television converters, fitness devices, GPS-tracking devices
and many other things.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 23:47:42 +0100
Subject: [Buildroot] Autobuilder update
Message-ID: <20160310234742.3df6dff2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Some autobuilder updates:

 - All the Buildroot pre-built external toolchains have been rebuilt
   with Buildroot 2016.02 + a few patches. To see which patches I'm
   using to build those external toolchains, see the branch at:

   http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=br-ext-toolchain-fixes

 - The br-sh4-full configuration has been changed to actually use the
   Buildroot toolchain, and not the pre-built Musl-cross toolchain.

 - I've fixed the Free Electrons build server, which was no longer
   building anything since quite some time, due to a lack of disk
   space. This will help re-increase the number of builds done each day.

Let me know if there are other things that should be improved/changed
in the autobuilder setup (be it adding more toolchain configurations,
or other changes).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

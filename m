From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Thu, 20 Mar 2008 15:58:49 +0100
Subject: [Buildroot] Problem building busybox
References: <823018ed0803180357s43bf8890s37521d7606aca432@mail.gmail.com>
	<00be01c88a77$c9601e00$ad289e86@LPSC0173W>
Message-ID: <010801c88a9a$eaf30190$ad289e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,
I'm still learning the basics of buildroot, so please bear with me...

When I issue the general "make ARCH=ppc" I get the following error:

  CC      coreutils/yes.o
  AR      coreutils/lib.a
make[1]: Leaving directory 
`/home/guinevere/buildroot/project_build_ppc/genepy/b
usybox-1.9.1'
make: *** 
[/home/guinevere/buildroot/project_build_ppc/genepy/root/bin/busybox]
Error 2

But if I do the same "make ARCH=ppc" from 
project_build_ppc/genepy/busybox-1.9.1 then I get a clean compilation...

Can someone please explain the discrepancy ? Are they using different 
.configs ?

I made sure that BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/.config"
is identical to project_build_ppc/genepy/busybox-1.9.1/.config.

And BTW, what does Error 2 mean ?!?
/home/guinevere/buildroot/project_build_ppc/genepy/root/bin/busybox doesn't 
exist

Thanks
-- 
Guillaume Dargaud
http://www.gdargaud.net/

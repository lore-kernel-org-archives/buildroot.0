From: Frank Kujawski <buildroot@fp8.com>
Date: Fri, 13 Jul 2007 14:24:59 -0500 (CDT)
Subject: [Buildroot] make error around modules.dep
Message-ID: <39689.75.129.164.68.1184354699.squirrel@kujawski.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,
I hope this gets formatted correctly.
I am trying to compile, it worked last month.  I am at svn 19083.  I don't
know what I was at last month though.
It is right after wireless tools, and looks like it is putting together module
dependencies for Linux.  I dont have the directory
/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/ which
is probably why it is failing?
I tried a pre-built arm, I am rolling my own device, and it failed at the same
spot.
Any ideas as to where to look?
  Frank



make[1]: Leaving directory
/projects/BuildRoot/buildroot/build_armeb/wireless_tools.28' /usr/bin/install
-D
/projects/BuildRoot/buildroot/toolchain_build_armeb/module-init-tools-3.2.2/depmod
/projects/BuildRoot/buildroot/build_armeb/staging_dir/bin/armeb-linux-depmod26
make: *** No rule to make target
`/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/.patched',
needed by
`/projects/BuildRoot/buildroot/project_build_armeb/uclibc/linux-2.6.21.5/.configured'.
 Stop.
bash-3.2$

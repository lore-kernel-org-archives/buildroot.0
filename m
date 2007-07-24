From: Frank Kujawski <buildroot@fp8.com>
Date: Tue, 24 Jul 2007 05:36:01 -0500 (CDT)
Subject: [Buildroot] buildroot/toolchain_build_armeb
Message-ID: <37183.75.129.164.68.1185273361.squirrel@kujawski.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


  Somewhere recently, buildroot/toolchain_build_armeb is nolonger being
created.  I get a make error at:
bzcat /projects/BuildRoot/buildroot/../dl/module-init-tools-3.2.2.tar.bz2 |
tar -C /projects/BuildRoot/buildroot/toolchain_build_armeb -xvf -
tar: /projects/BuildRoot/buildroot/toolchain_build_armeb: Cannot chdir: No
such file or directory

But, build_armeb/ project_build_armeb/ do get created correctly.

  Frank

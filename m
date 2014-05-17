From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 May 2014 11:10:09 +0200
Subject: [Buildroot] Status of your patches
Message-ID: <20140517111009.42385b15@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Spenser,

I'd like to get some update about the status of some of your patches in
patchwork, especially:

  http://patchwork.ozlabs.org/patch/314517/ [v2] gcc: coexist upstream with vendor git releases for mb and arc
  http://patchwork.ozlabs.org/patch/314518/ [v2] gdb: use git version for cross-gdb
  http://patchwork.ozlabs.org/patch/314512/ [v2] binutils: coexist upstream and vendor binutils for arc and microblaze
  http://patchwork.ozlabs.org/patch/314513/ [v2] libsigsegv: fix for microblaze
  http://patchwork.ozlabs.org/patch/314515/ [v2] glibc: change to tagged release
  http://patchwork.ozlabs.org/patch/314511/ [v2] binutils: change to tagged release
  http://patchwork.ozlabs.org/patch/314521/ [v2] gcc: change to tagged release
  http://patchwork.ozlabs.org/patch/314514/ [v2] gdb: change to tagged release

Most of these patches are related to the versions of Microblaze
toolchain components. But more recently, Waldemar has posted a patch
series to also update the Microblaze toolchain components, and his
series was merged.

Therefore, I'm wondering which parts of your series are still
necessary. Maybe Waldemar can also have a look and give us a status?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

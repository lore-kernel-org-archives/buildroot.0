From: Christopher Taylor <chtaylo3@gmail.com>
Date: Fri, 18 Apr 2008 19:47:34 -0400
Subject: [Buildroot] r21760 and device_table.txt problems
Message-ID: <2590773a0804181647y4200320du60683223dd30a1d4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

First, thank you all for your efforts.

I'm using r21760 and it appears that the device nodes aren't getting
populated.  I realize that the root filesystem is now created in
buildroot/project_build_ARCH/PROJECT/root but I don't see the device
nodes specified by the device_table.txt

I'm assume I'm missing a step that tells buildroot to read the device
table while it creates the root file system referenced above, but I
didn't find it via make menuconfig.

Any help would be appreciated!

Respectfully,
Chris

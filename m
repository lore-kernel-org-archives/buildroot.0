From: borkenpipe at gmail.com <borkenpipe@gmail.com>
Date: Sat, 31 May 2014 06:19:11 +0600
Subject: [Buildroot] gdbserver built as a static MIPS binary
Message-ID: <E81D6621-F6C7-444F-B542-14D7B4FFB401@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm looking for help on what options to set in make menuconfig to build a static gdbserver MIPS binary to run on my target MIPS vm running under qemu. I see the option under toolchain to build gdb for host but I'm not finding much success yet. I've built buildroot using the latest stable release and I have no issues with building a tool chain for MIPS but now I need remote debugging.

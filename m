From: GA K <guyarkam@gmail.com>
Date: Mon, 8 Mar 2021 20:27:06 -0600 (CST)
Subject: [Buildroot] Built-in Kernel command Line
Message-ID: <1615256826051-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using buildroot 90a82116,

I do make linux-xconfig (Linux5.10.7) and then in the boot options I change
the built-in kernel command line to include the following string:
"console=hvc0 earlycon=sbi loglevel=3"
Hoping that by default, (I mean when no boot argument is provided), the
kernel would boot in quiet mode.
However, the resulting kernel boots in verbose mode and prints all the
normal boot messages. When setting the boot argument to "quiet" the kernel
then boots in quiet mode. Is there a way to get the "quiet" mode built into
the Kernel?
G



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/

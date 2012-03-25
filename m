From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 25 Mar 2012 17:04:01 +0200
Subject: [Buildroot] (no subject)
In-Reply-To: <20120325133208.166570@gmx.net> (universeII@gmx.de's message of
 "Sun, 25 Mar 2012 15:32:08 +0200")
References: <20120213210552.192510@gmx.net>
 <87ty2uwhgu.fsf@macbook.be.48ers.dk> <20120325133208.166570@gmx.net>
Message-ID: <87mx74d8ny.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "universeII" == universeII  <universeII@gmx.de> writes:

Hi,

 universeII> I'm still new to buildroot and a little bit confused.

 universeII> My goal is to convince my company to replace the actually
 universeII> used LynxOS by Linux on our self developed PowerPC VME
 universeII> boards.  The only difference is a non-standard serial port,
 universeII> so I'm searching the kernel's serial driver.  Calling make
 universeII> menuconfig I do not find any possibility to select the
 universeII> different device drivers as I normally do when compiling
 universeII> vanilla kernels. Where can I configure which drivers are
 universeII> compiled into the kernel and which drivers will be compiled
 universeII> as modules?

make menuconfig is the configuration options for buildroot. To see the
configuration options for the Linux kernel, first make sure you have
enabled Kernel->Linux Kernel and then run:

make linux-menuconfig

To see the menuconfig interface of the kernel.

-- 
Bye, Peter Korsgaard

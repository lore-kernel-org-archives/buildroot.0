From: Williams Jr., Ernest L. <ernesto@slac.stanford.edu>
Date: Wed, 21 Jan 2015 17:26:00 +0000
Subject: [Buildroot] Newbie: linux kernel config
Message-ID: <2a448ad0e7234e3e9ffe7eda61b48b92@exch13-mail05.win.slac.stanford.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have multicore machines with greater than 8 CPUs

I would like to support more than the default 8 CPUs  (i.e.  CONFIG_NR_CPUS=8)

When I run make linux-xconfig  and search for the following parameter "X86_BIGSMP"; unable to set.
The search/find actually discovers  "X86_BIGSMP" and gives a description only. :(



Support for big SMP systems with more than 8 CPUs (X86_BIGSMP)

CONFIG_X86_BIGSMP:

This option is needed for the systems that have more than 8 CPUs

Symbol: X86_BIGSMP [=n]
Type : boolean
Prompt: Support for big SMP systems with more than 8 CPUs
Location:
-> Processor type and features
Defined at arch/x86/Kconfig:330
Depends on: X86_32 [=n] && SMP [=y]



How can I find and set this parameter?
Or should I just select  "CONFIG_MAXSMP"  and call it a day?


Thanks in advance for your help.



Cheers,
Ernesto

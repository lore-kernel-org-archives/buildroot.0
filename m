From: =?windows-1251?B?1+jt6u7iIMDt5PDl6Q==?= <blackmesa@rambler.ru>
Date: Tue, 25 Nov 2008 13:25:29 +0300
Subject: [Buildroot] How to configure Linux with "Device Drivers->GPIO
	support"
Message-ID: <281629735.1227608729.191157228.68438@mcgi25.rambler.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Good Day.
I selected advanced Linux kernel configuration option from "make 
menuconfig" invoked in .../buildroot directory.

So all is OK with Linux building but the question1 is:
why in Linux configuration session "Device Drivers -> GPIO Support" is 
absent?

I have target "AMD Alchemy Processor", MIPSel architecture.

If I invoke "make menuconfig" in linux-2.6.27 directory by hand then 
there will be "Device Drivers -> GPIO Support" option.

So the question2 is:
is the option "Device Drivers -> GPIO Support" absent due to some 
special patches applied?

And question3:
is it able to build Linux from some existing linux_configuration_file ?

Thanks.

--
Andrew

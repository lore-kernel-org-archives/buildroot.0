From: Samir <samir.rawal@tokheimkaizen.com>
Date: Thu, 12 Apr 2007 17:33:11 +0530
Subject: [Buildroot] FW:  C++ support not working by Buildroot
Message-ID: <MAILrRjbDt3HvoFOAmE0000029d@mail.tokheimkaizen.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 

Hello Bernhard

 

I have tried with GCC-4.1.2

But still it's not working. It's gave the same ERROR.

I am using 

binutils = 2.16.1

Gcc = 4.1.2

uClibc = 0.9.28.3

Linux Kernel = 2.4.31

The Host environment = Redhat9 (2.4.20 Host-Kernel)

 

Waiting for your valuable Reply.

 

Thanks

 

Samir Raval

(R&D Department)

Tokheim Kaizen Pvt. Ltd.

 

-----Original Message-----
From: Bernhard Fischer [mailto:rep.dot.nop at gmail.com] 
Sent: Thursday, April 12, 2007 12:34 PM
To: Samir
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] C++ support not working by Buildroot

 

On Thu, Apr 12, 2007 at 09:18:57AM +0530, Samir wrote:

>Dear All

> 

> 

> 

>I am building Tool chain using Build root.

> 

>My target is at91rm9200(arm920t).

> 

> 

> 

>I also enable C++ support for that.

> 

>Tool chain is build successfully 

> 

> 

> 

>But when I compile my CPP project.

> 

>It doesn't work.

> 

>The ERROR is:

> 

>/home/buildroot/build_arm/staging_dir/gcc/arm-linux-uclibc/3.4.6/../../../a
r

>m-linux-uclibc/bin/ld:test1.o: Relocations in generic ELF (EM: 3).

 

4.1.2 and 4.2 work for me, fwiw.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070412/01d231c8/attachment-0001.htm 

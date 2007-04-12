From: Samir <samir.rawal@tokheimkaizen.com>
Date: Thu, 12 Apr 2007 09:18:57 +0530
Subject: [Buildroot] C++ support not working by Buildroot
Message-ID: <MAILrRjbDt3HvoFOAmE000001a9@mail.tokheimkaizen.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All

 

I am building Tool chain using Build root.

My target is at91rm9200(arm920t).

 

I also enable C++ support for that.

Tool chain is build successfully 

 

But when I compile my CPP project.

It doesn't work.

The ERROR is:

/home/buildroot/build_arm/staging_dir/gcc/arm-linux-uclibc/3.4.6/../../../ar
m-linux-uclibc/bin/ld:test1.o: Relocations in generic ELF (EM: 3).

Test1.o: could not read symbols:File is in wrong format

Collect2: ld returned 1 exit status.

 

I think my toolchain is OK.

There is some linking is required.

 

How to resolve this?

What parameter I need to support for enable C++?

What library should link?

 

Samir Raval

(R&D Department)

Tokheim Kaizen Pvt. Ltd.

 

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070412/087629f0/attachment.htm 

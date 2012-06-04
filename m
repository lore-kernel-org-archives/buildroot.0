From: Kevin Wilson <wkevils@gmail.com>
Date: Mon, 4 Jun 2012 15:22:05 +0300
Subject: [Buildroot] generated shared libraries are not ARM but Intel - why ?
Message-ID: <CAGXs5wWx3-kTe9T5OQDLqfh80K9hz0OOkkqT+aNKYjQhjRbn3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I want to make a filesystem for Arm running 32 bit V7 arm processor.
My host machine is x86_64 Intel machine
I downloaded buildroot-2012.02.tar.bz2
buildroot-2012.02
I selected
Test architecure - arm
 Target Architecture Variant - generic arm

I selected very few packages like gcc

I ran "make" and a rootfs tar file was generated.

After extracting it,  I  could not boot from it ;
chekling further into the filesystem I created got:

 file /lib/libdl-0.9.32.1.so
libdl-0.9.32.1.so: ELF 32-bit LSB shared object, Intel 80386, version
1 (SYSV), dynamically linked (uses shared libs), stripped
file  lib/libgcc_s.so.1
lib/libgcc_s.so.1: ELF 32-bit LSB shared object, Intel 80386, version
1 (SYSV), dynamically linked, stripped


It should have been an ARM object library.
What did I do wrong ?


Regards,
Kevin

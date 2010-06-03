From: Paul Jones <paul@pauljones.id.au>
Date: Thu, 3 Jun 2010 15:04:35 +1000
Subject: [Buildroot] Creating autotargets packages
Message-ID: <063801cb02da$42ef0d80$c8cd2880$@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

 

I'm trying to create a package for Mono, which uses the autotools build
system. I created a simple mono.mk file based on the sample in the Buildroot
documentation, but I get an error (see below) and I don't know enough about
how the build system works to troubleshoot. Any pointers would be
appreciated!

 

>>> mono 2.6.4 Extracting

>>> mono 2.6.4 Patching package/mono

for file in config.guess config.sub; do for i in $(find
/home/peejay/mini2440-dev/buildroot-x86/output/build/mono-2.6.4 -name
$file); do cp package/gnuconfig/$file $i; done; done

>>>   Patching libtool

 

Applying buildroot-libtool.patch using plaintext: 

patching file ltmain.sh

Hunk #1 FAILED at 273.

Hunk #2 succeeded at 5412 (offset 3005 lines).

Hunk #3 FAILED at 2551.

Hunk #4 FAILED at 2895.

Hunk #5 succeeded at 8058 with fuzz 1 (offset 2446 lines).

Hunk #6 FAILED at 5937.

4 out of 6 hunks FAILED -- saving rejects to file ltmain.sh.rej

Patch failed!  Please fix buildroot-libtool.patch!

 

Applying buildroot-libtool.patch using plaintext: 

patching file ltmain.sh

Hunk #1 FAILED at 273.

Hunk #2 succeeded at 5412 (offset 3005 lines).

Hunk #3 FAILED at 2551.

Hunk #4 FAILED at 2895.

Hunk #5 succeeded at 8058 with fuzz 1 (offset 2446 lines).

Hunk #6 FAILED at 5937.

4 out of 6 hunks FAILED -- saving rejects to file ltmain.sh.rej

Patch failed!  Please fix buildroot-libtool.patch!

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100603/076789bb/attachment-0001.html>

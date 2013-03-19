From: Daniel Price <daniel.price@gmail.com>
Date: Tue, 19 Mar 2013 13:43:26 -0700
Subject: [Buildroot] Interest in upgrading syslinux to 5.x?
Message-ID: <CAKduhSuJ_-2B7i7YOKyuErfhve_CXi1UvmNX_U7iQUXYt3c7hw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi folks,

I was wondering if there is interest in having the syslinux bootloader
upgraded to the 5.x series.  Right now in buildroot we have 4.05.

I have a 64-bit x86 system wherein there is a requirement that I
deliver syslinux's utilities and the mbr.bin to the target, and what I
have found after some experimentation is that syslinux 5.x seems
better suited to this, and is more amenable to running on a 64-bit x86
system.

I have a private recipe I'm calling 'syslinux-tgt' which accomplishes
this for myself, but I was wondering if it makes sense to drive (a) an
upgrade to 5.x and (b) additional changes to make it possible
(optionally) to deliver syslinux onto the target system.  Thoughts?
I'm willing to at least take a first pass at it.

       -dp

--
Daniel.Price at gmail.com; Twitter: @danielbprice

From: scsijon <scsijon@lamiaworks.com.au>
Date: Sun, 10 Feb 2019 15:20:45 +1100
Subject: [Buildroot] Buildroot-2.18.11 fails?
Message-ID: <e40ef8db-c9df-c6db-7e61-aac0f190712a@lamiaworks.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I thought i'd try it after so many years.
I thought i'd try the last complete version before trying a snapshot.

So, what I did was to download and unpacked the 2018.11 package from 
your site.

Went into make menuconfig and changed (to match what I am use to working 
with)>
target Architecture to x86_64;
toolchain to glibc;
gcc version to 8.x;
linux kernel to 4.18 and added a defcon name;
exited.

make source (to download the packages required so I could build offline);

make.

All went well until host-gcc-final-8.2.0 where it errored, failed and 
exited.

Before I consider proceeding further, could I have some help and advice 
with this please. I would have thought this should have been ok.

I have attached the relevant section of the log file.

thanks
scsijon


-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-2018.11-fail1.tar.gz
Type: application/x-gzip
Size: 5063 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190210/be394e48/attachment-0001.bin>

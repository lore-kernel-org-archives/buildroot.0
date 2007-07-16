From: Jerry Richards <jerryr@tonecommander.com>
Date: Mon, 16 Jul 2007 12:11:08 -0700
Subject: [Buildroot] Using Ram-Resident Filesystem
Message-ID: <002201c7c7dd$11ae3d80$2c48a8c0@greyhawk.tonecommander.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am doing cross-development using Linux with a Lauterbach TRACE32
In-Circuit Debugger (ICD).

I would like to substitute my mtd0 to be a RAM address (normally FLASH),
where I store my SQUASHFS filesystem.  In other words, I want my
environment/filesystem to be as close to what will be used when the target
runs in FLASH without the ICD.

Question:

How can I easily fake-out Linux to use the RAM-resident read-only filesystem
instead of it being FLASH-resident?  As far as the kernel is concerned, the
only difference should be where it reads the filesystem.

Can the above be done easily?  I would rather not use a RAM-Disk or network
filesystem.

Best Regards,
Jerry

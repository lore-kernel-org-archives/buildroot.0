From: Nataraj S Narayan <natarajsn@gmail.com>
Date: Sat, 13 Mar 2010 13:24:43 +0530
Subject: [Buildroot] jffs2 problem
Message-ID: <630286c71003122354rb2e6146ofe939c85465b74e5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jacmet

 rootfs.arm.jffs2  from BR git. gives me at boot

 CLEANMARKER node found at 0x00660000 has totlen 0xc != normal 0x0
 jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at
0x01f86ef0: 0x5feb instead

 and finally

 Kernel panic - not syncing: Attempted to kill init!

When doing by hand, which works , i use:-

#sudo mkfs.jffs2 --pad --little-endian --eraseblock=0x20000 -n -o
last.jffs2  -s 0x800 -r /media/usb/

regards

Nataraj

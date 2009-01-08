From: RainerB <berns@BEKA-Elektronik.de>
Date: Thu, 8 Jan 2009 04:58:32 -0800 (PST)
Subject: [Buildroot]  GTK-DEMO crash with Segmentation fault
Message-ID: <21351308.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

i have generated buildroot (rev. 24695 and uClibc 0.9.29) for a AT91SAM9261
with Directfb and GTK+.
It works so far. There is one linking problem with tslib. 
After fixing this i'am able to start the directfb samples and generate and
run samples by myself with the toolchain.  
Starting gtk-demo causes  a segmentation fault (Signal 11).

gdb gtk-demo core
...
#0  0x406fcaf0 in ?? () from /lib/libc.so.0

Has anybody tried gtk+ with directfb during the last time ?
Thanks for help.

Regards

Rainer
-- 
View this message in context: http://www.nabble.com/GTK-DEMO-crash-with-Segmentation-fault-tp21351308p21351308.html
Sent from the BuildRoot mailing list archive at Nabble.com.

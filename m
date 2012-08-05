From: Wojciech M. Zabolotny <wzab01@gmail.com>
Date: Sun,  5 Aug 2012 15:10:09 +0200
Subject: [Buildroot] Correction: Added packages: libmsgpack (v. 0.5.7) and
	msgpack-python (0.1.10)
Message-ID: <1344172212-2929-1-git-send-email-wzab01@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


In the previous version of patch I've used old commands at the end of the .mk
files. They were good for buildroot-2011.11 but didn't work for the cuurent
version. New packages were displayed in "make menuconfig", but silently ignored
during the compilation.
Now I send the corrected patches.

Regards, 
Wojtek

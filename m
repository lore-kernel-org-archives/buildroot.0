From: Tim Barr <tbarr@multitech.com>
Date: Tue, 22 Jan 2008 15:48:26 -0600
Subject: [Buildroot] Another ARM kernel build problem (this time with
	2.6.22.10 kernel)
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E609BFDDAB@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While waiting for an answer on my 2.6.22.1 kernel build problems, I made
a new config file using the 2.6.22.10 linux kernel. After solving a web
access issue, I come up with the following error:

Can't exec "aclocal": No such file or directory at /usr/bin/autoreconf
line 182.
Use of uninitialized value in pattern match (m//) at /usr/bin/autoreconf
line 182.
Can't exec "automake": No such file or directory at /usr/bin/autoreconf
line 183.
Use of uninitialized value in pattern match (m//) at /usr/bin/autoreconf
line 183.
Can't exec "aclocal": No such file or directory at
/usr/share/autoconf/Autom4te/FileUtils.pm line 290.
autoreconf: failed to run aclocal: No such file or directory
/bin/sh: ./configure: not found
make: ***
[/home/falingtrea/buildroot/build_arm_wchar/tslib-1.0/.configured] Error
127


There is a script file called 'autoreconf' located in the /usr/bin
directory that has an 'aclocal' section to it, but no file named
'aclocal' and no directory named 'autoreconf'. So what am I doing wrong
this time??


Timothy Barr
Hardware Development Engineer
for Multi-Tech Systems, Inc.
tbarr at multitech.com

From: Nicholas Kinar <n.kinar@usask.ca>
Date: Sat, 28 Nov 2009 19:39:20 -0600
Subject: [Buildroot] Updated status on the compilation of busybox on Mac OS X
Message-ID: <4B11D0C8.9050901@usask.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello--

I've recently found a post on this mailing list dating back to 2007.  
The author of this post had found that busybox would build on Mac OS X 
up to the point where fakeroot would be required.

http://lists.busybox.net/pipermail/buildroot/2007-February/002138.html

I've now downloaded and built fakeroot from "fakeroot_1.14.tar.gz."  My 
build system was Mac OS X 10.5.8 with Darwin 9.8.0, using 
i686-apple-darwin9-gcc-4.0.1 (GCC) 4.0.1 (Apple Inc. build 5493).  The 
source download location was:

http://ftp.debian.org/debian/pool/main/f/fakeroot/

However, I've found that the more recent versions of fakeroot (i.e. 
fakeroot_1.14.3.tar.gz) do not cleanly build on Mac OS X.

What is the updated status on Mac OS X support for buildroot?

Nicholas

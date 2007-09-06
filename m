From: Roderick Taylor <myopiate@gmail.com>
Date: Thu, 6 Sep 2007 22:59:56 +1000
Subject: [Buildroot] this commit breaks x86_64 toolchain builds
Message-ID: <e83232070709060559u27a12f78u1ddb96d7c4d7bc20@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

x86_64, by default uses the lib64 directory to hold 64-bit libraries.
not the lib directory as assumed by this commit.

http://buildroot.busybox.net/cgi-bin/viewcvs.cgi?rev=19702&view=rev

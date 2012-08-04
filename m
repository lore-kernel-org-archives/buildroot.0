From: Wojciech M. Zabolotny <wzab01@gmail.com>
Date: Sat,  4 Aug 2012 17:06:39 +0200
Subject: [Buildroot] Added packages: libmsgpack (v. 0.5.7) and
	msgpack-python (0.1.10)
Message-ID: <1344092800-15712-1-git-send-email-wzab01@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I had to add two packages msgpack-python and libmsgpack to my embedded
system running Linux compiled with buildroot-2011.11
Unfortunately this version of buildroot does not support setuptools,
so I couldn't use the msgpack-python v. 0.2.0, and had to use older v.
 0.1.10.
As my buildroot is compiled without C++ support, I had also to disable
the C++ API in libmsgpack.

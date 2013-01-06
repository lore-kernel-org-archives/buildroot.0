From: Floris Bos <bos@je-eigen-domein.nl>
Date: Sun, 06 Jan 2013 03:26:36 +0100
Subject: [Buildroot] [PATCH 2/3] rpi-userland: new package
In-Reply-To: <0e55a309b9f4a9b8ee175d301d40e7574e9227b0.1357394983.git.maxime.hadjinlian@gmail.com>
References: <cover.1357394983.git.maxime.hadjinlian@gmail.com>
 <0e55a309b9f4a9b8ee175d301d40e7574e9227b0.1357394983.git.maxime.hadjinlian@gmail.com>
Message-ID: <50E8E0DC.1010206@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/05/2013 03:10 PM, Maxime Hadjinlian wrote:
> Introducing a package to build the userland part of the Raspberry,
> needed by anyone who would want to build a rootfs for a RaspberryPi.

rpi-userland does not build with the default buildroot uClibc toolchain.

==
[ 25%] 
/hdd/max/dev/tmp/buildroot/output/build/rpi-userland-9852ce28826889e50c4d6786b942f51bccccac54/interface/vcos/glibc/vcos_backtrace.c:30:22: 
fatal error: execinfo.h: No such file or directory
==

Ran into the same issue a while back.
You can borrow my patch: 
https://github.com/maxnet/userland/commit/93ae1bcd8005216baf7361ba860b53a2cf2e0401



Yours sincerely,

Floris Bos

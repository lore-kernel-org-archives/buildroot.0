From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 10:47:29 +0100
Subject: [Buildroot] [PATCH] mpdecimal: disable static build
In-Reply-To: <235ca63e3c273ed4feb8d39cfbb5c05b1fe50d0f.1416733726.git.baruch@tkos.co.il>
References: <235ca63e3c273ed4feb8d39cfbb5c05b1fe50d0f.1416733726.git.baruch@tkos.co.il>
Message-ID: <20141123104729.0951c20f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 23 Nov 2014 11:08:46 +0200, Baruch Siach wrote:
> mpdecimal always tries to build its shared library.
> 
> Fixes:
> http://autobuild.buildroot.net/results/276/2764bd8c42ba659682760ffc6afa933b7530d06c/
> http://autobuild.buildroot.net/results/3cc/3cca0aacc4d66c49b21d23681813abea5a1b32e0/
> http://autobuild.buildroot.net/results/207/20783d1448464d957862e1c70585844f86aed237/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

While in flight, I have just cooked a patch that allows to build
mpdecimal only as a static library. I'll send it later today.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

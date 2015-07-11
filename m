From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 00:28:30 +0200
Subject: [Buildroot] build libstdc++.so.6
In-Reply-To: <1436634230228-105322.post@n4.nabble.com>
References: <1436634230228-105322.post@n4.nabble.com>
Message-ID: <20150712002830.018e4bc0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Jul 2015 10:03:50 -0700 (PDT), glscantlen wrote:
> I am using external custom toolchain Linaro-4.9
> Linaro has been downloaded from the binary archive,
> gcc-linaro-4.9-2015.02-3-x86_64_arm-linux-gnueabihf
> How/Can BuildRoot build the libstdc++.so.6 library ?

If you're using an external toolchain, then the libstdc++.so.6 library
is provided by the external toolchain.

However, we have not yet looked at the 2015.02 Linaro toolchain. Unless
you specifically need this toolchain, I would recommend you to use the
pre-configured Linaro toolchain available in Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Fri, 4 Mar 2011 15:52:14 -0600
Subject: [Buildroot] Applying custom kernel patches
In-Reply-To: <AANLkTi=_dHFneTLXe3+P1-cOM2dsLsQW6f_fgbK7hSQy@mail.gmail.com>
References: <AANLkTi=_dHFneTLXe3+P1-cOM2dsLsQW6f_fgbK7hSQy@mail.gmail.com>
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1F734F29@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> if I patch "/opt/buildroot/output/toolchain/linux-2.6.38-rc5"

that is the Linux-headers directory.  The _kernel_ gets compiled
under buildroot/output/build/linux-$(LINUX_VERSION).

So, are you having problems building the kernel-headers or the
kernel?

Andy

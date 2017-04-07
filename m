From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Apr 2017 10:31:38 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain-external: fix handling of
 ld.so
In-Reply-To: <CAAXf6LXp_Y4A+sNygeLMwqv3CiOwbeEAFxcRa0vwY-8a=_REVQ@mail.gmail.com>
References: <20170406202505.17605-1-patrickdepinguin@gmail.com>
 <20170406223422.388475a5@free-electrons.com>
 <CAAXf6LW2Oo8VPoiKJ5LfCRgj37_uTjqu6jbN+_c+Ts3Fp9k8cA@mail.gmail.com>
 <CAAXf6LXp_Y4A+sNygeLMwqv3CiOwbeEAFxcRa0vwY-8a=_REVQ@mail.gmail.com>
Message-ID: <20170407103138.6b980c45@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 7 Apr 2017 10:16:31 +0200, Thomas De Schampheleire wrote:

> Btw, in the x86_64 case, the problem was detected very early by
> check-bin-arch, but in the mips case apparently not. I have not been able
> to look into the code and won't be able to the coming days, but am I right
> that this is the type of thing that check-bin-arch should find?

It depends if the ELF machine type was different or not between the two
sysroots. If they are different, then yes, it should have been detected.

(Again, please fix your e-mail client.)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

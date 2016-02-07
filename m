From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 22:51:42 +0100
Subject: [Buildroot] [PATCH] configs/qemu: bump to the latest linux
 versions
In-Reply-To: <56B7B6B1.1020003@zacarias.com.ar>
References: <1454879953-19093-1-git-send-email-gustavo@zacarias.com.ar>
 <20160207222223.11b237a1@free-electrons.com>
 <56B7B6B1.1020003@zacarias.com.ar>
Message-ID: <20160207225142.21944d69@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 7 Feb 2016 18:27:13 -0300, Gustavo Zacarias wrote:

> If we want SMP on ARM testing we could just switch to a smp-enabled 
> vexpress, i've already tested that and it works without any significant 
> change other than qemu invocation (-smp 4).
> We can even make a "big" vexpress-a15 with smp + a15.
> I haven't dropped nuri because we have no policy/consensus on the qemu 
> samples, but on my side i'd +1 that, maybe adding the fat vexpress sample.

Fat VExpress (like A15 SMP) and dropping Nuri seems like a good idea.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

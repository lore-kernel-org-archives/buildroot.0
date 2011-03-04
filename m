From: Steve Calfee <nospamcalfee@yahoo.com>
Date: Fri, 4 Mar 2011 14:21:52 -0800 (PST)
Subject: [Buildroot] Applying custom kernel patches
In-Reply-To: <AANLkTi=_dHFneTLXe3+P1-cOM2dsLsQW6f_fgbK7hSQy@mail.gmail.com>
References: <AANLkTi=_dHFneTLXe3+P1-cOM2dsLsQW6f_fgbK7hSQy@mail.gmail.com>
Message-ID: <518665.81144.qm@web161818.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>From: bruce bushby <bruce.bushby@gmail.com>

>I've tried placing my patches in:
>/opt/buildroot/linux/kernel-patches/0001-linux-2.6.38-rc5.patch
>
>
>I also tried putting them in
>/opt/buildroot/package/linux/kernel-patches/0001-linux-2.6.38-rc5.patch
>
Hi,

You may have a path problem for your patches. The path should be given in your 
*_defconfig. 


And buildroot will automatically apply patches at the appropriate time if they 
are named in the form linux*patch. See the makefile.

so 0001-linux-2.6.38-rc5.patch should be linux-001-2.6.38-rc5.patch

Regards, Steve



      

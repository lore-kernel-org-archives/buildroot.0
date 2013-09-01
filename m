From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Sun, 1 Sep 2013 13:43:34 -0300
Subject: [Buildroot] Fwd: [Nios2-dev] removal of uClinux-dist and u-boot
	gits from sopc server
In-Reply-To: <52234897.4050500@wytron.com.tw>
References: <52234897.4050500@wytron.com.tw>
Message-ID: <CAAEAJfDtdBg3BviZQRDNT9En82TmZudJ=jMGY=X81RyjiXSYOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Buildroot,

I'm forwarding you an announce from the nios2-dev mailing list, which I think
you might find of interest.

Apparently they are moving away from uCLinux, and instead using Buildroot
and Yocto.

Therefore, I look forward to see the nios2 support in the November release!

Ezequiel

---------- Forwarded message ----------
From: Thomas Chou <thomas@wytron.com.tw>
Date: 1 September 2013 11:00
Subject: [Nios2-dev] removal of uClinux-dist and u-boot gits from sopc server
To: nios2-dev at sopc.et.ntust.edu.tw


Dear all,

As our network bandwidth is limited, we would like to remove some git
repo which are either deprecated or unnecessary.

The uClinux-dist, which was cloned from Blackfin uclinux, was
deprecated since 2012R2 as stated in Blackfin web site. Later blackfin
releases are based on Buildroot. There are few updates from blackfin,
and will be removed from our server. If you need update, please fetch
from remote "blackfin".

We will use buildroot and yocto for nios2 rootfs/kernel/toolchain
building in near future.

The u-boot git will be removed from our server, because nios2 support
is up-to-date in mainline u-boot and I am the custodian of nios2 arch.
Please fetch update from remove "denx".

Some very old branches in linux-2.6 git will be removed, too. I will
run git-gc to reduce the size.

Please let me know if you have any suggestions.

Best regards,
Thomas Chou


_______________________________________________
Nios2-dev mailing list
Nios2-dev at sopc.et.ntust.edu.tw
http://sopc.et.ntust.edu.tw/cgi-bin/mailman/listinfo/nios2-dev


-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar

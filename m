From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 22:53:32 +0200
Subject: [Buildroot] [PATCH 00/20] system: properly handle systemd as
 init system
In-Reply-To: <CAAkeqgVMVSspUdMnPNWi_RQyLPhyf-1bys=d2btKrStEk34VMg@mail.gmail.com>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <CAAkeqgVMVSspUdMnPNWi_RQyLPhyf-1bys=d2btKrStEk34VMg@mail.gmail.com>
Message-ID: <20170719225332.560a9a06@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Jul 2017 13:14:58 -0700, Andrey Yurovsky wrote:

> For what it's worth,
> 
> Tested-by: Andrey Yurovsky <yurovsky@gmail.com>
> 
> using some in-house configs (armv5 and armv7) with and without
> systemd-networkd, verified journald functionality and the state of
> /var and so on.

Thanks a lot for testing, very useful to get some feedback!

Can you confirm that it fixes the journald issue reported in bug
https://bugs.busybox.net/show_bug.cgi?id=7892 ?

Also, it would be useful if someone interested in systemd could look at
bugs https://bugs.busybox.net/show_bug.cgi?id=9881 and
https://bugs.busybox.net/show_bug.cgi?id=9926.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

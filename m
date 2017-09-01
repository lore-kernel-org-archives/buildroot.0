From: Zeno Endemann <zeno.endemann@googlemail.com>
Date: Fri, 1 Sep 2017 14:30:29 +0200
Subject: [Buildroot] Minnowboard max Atom options suboptimal?
Message-ID: <36a059e5-93d7-4e56-5dc3-57be314e5401@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The minnowboard_max_defconfig in buildroot is using the BR2_x86_atom=y
option and the used kernel config contains CONFIG_MATOM=y.

Since the CPU on that board is a newer Atom with out of order execution
I was wondering if BR2_x86_corei7=y and a generic x86/64 kernel wouldn't
be better. At least in my test the system seems to be running fine with
these options and if I see this right the intel yocto layer config for
the Minnowboard max is also using them.

Thanks for any hints,

Zeno Endemann

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 21:28:06 +0200
Subject: [Buildroot] [PATCH 0/2] qemu_xtensa_lx60 updates
In-Reply-To: <1459502524-23349-1-git-send-email-jcmvbkbc@gmail.com>
References: <1459502524-23349-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20160418212806.5a144b4a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Apr 2016 12:22:02 +0300, Max Filippov wrote:

> Max Filippov (2):
>   configs/qemu_xtensa_lx60_defconfig: switch to dc233c
>   configs: add qemu_xtensa_lx60_nommu_defconfig

Both applied. Thanks to Waldemar for the testing!

I must say I really don't like those big Xtensa toolchain "overlay"
tarball, you have no idea what changed :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

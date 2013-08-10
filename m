From: Axel Lin <axel.lin@ingics.com>
Date: Sat, 10 Aug 2013 10:08:01 +0800
Subject: [Buildroot] [PATCH 1/3] busybox: set/unset CONFIG_NOMMU
In-Reply-To: <1376076221-28066-1-git-send-email-gustavo@zacarias.com.ar>
References: <1376076221-28066-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CAFRkauBPLBDR+7m7WHA0wo_NkJjN4VRQp1Jzp2tL8q6hTqC+tQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/8/10 Gustavo Zacarias <gustavo@zacarias.com.ar>:
> Set busybox .config CONFIG_NOMMU appropiately and streamline this new
> setting with the previous BUSYBOX_DISABLE_MMU_APPLETS in a single
> BUSYBOX_SET_MMU definition (since it's not just applets now).
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Hi Gustavo,

I try to build for noMMU with below patches:
[PATCH 1/3] busybox: set/unset CONFIG_NOMMU
[PATCH 2/3] uclibc: set MMU usage accordingly

However, I still got ELF executable:
$ file output/target/bin/busybox
output/target/bin/busybox: setuid ELF 32-bit LSB executable, ARM,
version 1 (SYSV), statically linked, stripped

Regards,
Axel

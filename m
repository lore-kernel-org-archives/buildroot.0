From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 17 Jun 2014 15:58:24 +0200
Subject: [Buildroot] How to handle custom kernel config
In-Reply-To: <53A045EC.4030107@gmail.com>
References: <53A04483.9030601@gmail.com>
 <CAGm1_ktpFoYZSu2Yjd_hNpiHbySLv8FPrHtJ91DQv4iNmthYHg@mail.gmail.com>
 <53A045EC.4030107@gmail.com>
Message-ID: <CAGm1_kvcZDk_ke4OVgx1dO6_qWOhff7LupEKj42kgiq0Fyog6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 17, 2014 at 3:43 PM, Marco Trapanese
<marcotrapanese@gmail.com> wrote:
> Il 17/06/2014 15:40, Yegor Yefremov ha scritto:
>
>> As soon as you're happy with your new .config in the build directory,
>> you just manually overwrite your board/sub_directory/linux.config Yegor
>
>
> Ok, so I should do the following:
>
> 1) copy the custom file to .config

This step will be made by Buildroot, when you first compile the kernel
or perhaps if you invoke make linux-reconfigure. Your custom .config
will be copied to output/build/linux-xxx

> 2) edit that with make linux-menuconfig
> 3) copy back the .config to custom file

Other step are correct.

Yegor

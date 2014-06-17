From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Tue, 17 Jun 2014 15:43:08 +0200
Subject: [Buildroot] How to handle custom kernel config
In-Reply-To: <CAGm1_ktpFoYZSu2Yjd_hNpiHbySLv8FPrHtJ91DQv4iNmthYHg@mail.gmail.com>
References: <53A04483.9030601@gmail.com>
 <CAGm1_ktpFoYZSu2Yjd_hNpiHbySLv8FPrHtJ91DQv4iNmthYHg@mail.gmail.com>
Message-ID: <53A045EC.4030107@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 17/06/2014 15:40, Yegor Yefremov ha scritto:

> As soon as you're happy with your new .config in the build directory,
> you just manually overwrite your board/sub_directory/linux.config Yegor

Ok, so I should do the following:

1) copy the custom file to .config
2) edit that with make linux-menuconfig
3) copy back the .config to custom file


Now I understand!
Marco

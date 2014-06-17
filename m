From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 17 Jun 2014 15:40:34 +0200
Subject: [Buildroot] How to handle custom kernel config
In-Reply-To: <53A04483.9030601@gmail.com>
References: <53A04483.9030601@gmail.com>
Message-ID: <CAGm1_ktpFoYZSu2Yjd_hNpiHbySLv8FPrHtJ91DQv4iNmthYHg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 17, 2014 at 3:37 PM, Marco Trapanese
<marcotrapanese@gmail.com> wrote:
> Hello,
> reading the docs I'm not sure how to handle a custom kernel config.
> Let's say I have a custom linux.config file in a board/sub_directory.
> In the make nconfig menu I selected the right path.
>
> Now I want to change some settings. As far as I understand if I issue make
> linux-menuconfig it will read the default .config file, not the custom one.
> Am I wrong?
>
> What's the right way to change those settings?

As soon as you're happy with your new .config in the build directory,
you just manually overwrite your board/sub_directory/linux.config

Yegor

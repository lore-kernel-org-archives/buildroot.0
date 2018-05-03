From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 23:26:44 +0200
Subject: [Buildroot] [PATCH v3 0/9] Add /etc/shells handling
In-Reply-To: <1516356909-18620-1-git-send-email-romain.naour@smile.fr>
References: <1516356909-18620-1-git-send-email-romain.naour@smile.fr>
Message-ID: <20180503232644.72278d41@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Jan 2018 11:15:00 +0100, Romain Naour wrote:

> Romain Naour (9):
>   package/skeleton-init-common: add /bin/sh to /etc/shells
>   package/busybox: add /bin/{a,hu}sh to /etc/shells
>   package/dash: add /etc/dash to /etc/shells
>   package/screen: add /usr/bin/screen to /etc/shells
>   package/tmux: add /usr/bin/tmux to /etc/shells
>   package/zsh: add /bin/zsh to /etc/shells
>   package/mksh: add /bin/mksh to /etc/shells
>   package/bash: add missing double-dollar for /etc/shells
>   package/bash: use target finalize hook

All applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

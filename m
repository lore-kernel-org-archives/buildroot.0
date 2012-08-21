From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Aug 2012 11:56:51 +0200
Subject: [Buildroot] [PATCH] ifplugd: add --with-initdir= to config
 command
In-Reply-To: <1345298656-12714-1-git-send-email-shawnjgoff@gmail.com>
References: <1345298656-12714-1-git-send-email-shawnjgoff@gmail.com>
Message-ID: <20120821115651.7908bfa9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 18 Aug 2012 10:04:16 -0400,
"Shawn J. Goff" <shawnjgoff@gmail.com> a ?crit :

> From: "Shawn J. Goff" <shawnjgoff@gmail.com>
> 
> ifplugd refuses to configure without this set.

When you say "configure", do you mean the execution of the configure
script at build time, or the startup of ifplugd on the target?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

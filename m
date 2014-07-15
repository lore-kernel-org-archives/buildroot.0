From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 23:39:24 +0200
Subject: [Buildroot] [PATCH 0/6] systemd improvements
In-Reply-To: <1404406659-31109-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1404406659-31109-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140715233924.4588153a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Thu,  3 Jul 2014 18:57:33 +0200, Eric Le Bihan wrote:

> Eric Le Bihan (6):
>   dbus: enable systemd support

This one applied.

>   systemd: revert getty service installation

This one waiting for your feedback on Yann's comment.

>   systemd: fix path for kmod in service files

This one applied.

>   systemd: bump to version 214

This one no longer applies, probably due to "systemd: revert getty
service installation" not being applied.

>   systemd: add hook to fix /run, /var

Still unresolved issues during the discussion with Arnout. I believe
the only good way moving forward is to improve the skeleton strategy.

>   systemd: install timesync service if selected

One remaining suggestion/question from Arnout.

Could you respin with the appropriate changes?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

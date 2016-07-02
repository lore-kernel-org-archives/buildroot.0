From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 13:14:43 +0200
Subject: [Buildroot] [PATCH 01/31] package/systemd: add optional support
 for tmpfiles
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20160702131443.6f9e8558@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Jul 2016 23:51:01 +0200, Maxime Hadjinlian wrote:
> From: Gabe Evans <gabe@hashrabbit.co>
> 
> Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
> [Maxime: Add default y]
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

I've applied patches 1-18, but for many of them, I had to rewrap the
Config.in help text as several of them had too long lines.

Due to this, patch 19 (which re-orders the Config.in options) did not
apply, with lots of conflicts.

I nonetheless managed to apply patches 20, 21, 22, 23 and 24, as well
as 27 and 28. So you have 19, 25, 26, 29, 30 and 31 that remain to be
applied. I've kept them in the "New" state on patchwork so that you can
easily identify what remains to be applied.

Also, could you integrate your bootchard changes in the same series, in
order to avoid conflicts?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

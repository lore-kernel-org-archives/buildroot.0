From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 11:54:09 +0200
Subject: [Buildroot] [PATCH] linux: fix name of config variable
In-Reply-To: <20170604094839.23541-1-yann.morin.1998@free.fr>
References: <20170604094839.23541-1-yann.morin.1998@free.fr>
Message-ID: <20170605115409.5e7c55d8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Jun 2017 11:48:39 +0200, Yann E. MORIN wrote:
> In 4c10eedc1 (systemd: enable required kernel features), we added
> setting a few required kernel features to ensure systemd works.
> 
> However, there was a typo for one of the variables: CONFIG_TMPFS_XATTR
> was written as CONFIG_TMPFS_POSIX_XATTR, which does not exist (and never
> ever existed, at least not since 2.6.12)...
> 
> Fixes #9926.

The patch looks good, but I'm not sure why you say it fixes #9926. It
has been noticed as part of the #9926 discussion, but to me it doesn't
fix this bug.

Could you clarify?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

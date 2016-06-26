From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 21:33:56 +0200
Subject: [Buildroot] [PATCH v3 2/5] package/efl: bump to 1.17.2
In-Reply-To: <1466630866-28779-2-git-send-email-romain.naour@gmail.com>
References: <1466630866-28779-1-git-send-email-romain.naour@gmail.com>
 <1466630866-28779-2-git-send-email-romain.naour@gmail.com>
Message-ID: <20160626213356.1a344560@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Jun 2016 23:27:43 +0200, Romain Naour wrote:

> -	select BR2_PACKAGE_LUAJIT # Lua support broken with 5.2+
> +	select BR2_PACKAGE_LUAJIT # Lua support broken

This change really belongs with the first patch, so I moved it to the
first patch, for consistency.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

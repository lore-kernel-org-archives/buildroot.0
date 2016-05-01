From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 23:41:01 +0200
Subject: [Buildroot] [PATCH 1/5] package/nginx: bump version to 1.10.0
In-Reply-To: <1462132345-28253-1-git-send-email-martin@barkynet.com>
References: <1462132345-28253-1-git-send-email-martin@barkynet.com>
Message-ID: <20160501234101.1f4b6c8d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 May 2016 20:52:21 +0100, Martin Bark wrote:

>  # mail modules
>  ifeq ($(BR2_PACKAGE_NGINX_MAIL),y)
> +NGINX_CONF_OPTS += --with-mail

Is this directly related to the bump?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

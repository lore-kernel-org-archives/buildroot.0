From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 15:55:36 +0200
Subject: [Buildroot] [PATCH 1/4] linux: bump default to version 4.8-rc5
In-Reply-To: <1473441497-29986-1-git-send-email-festevam@gmail.com>
References: <1473441497-29986-1-git-send-email-festevam@gmail.com>
Message-ID: <20160911155536.1db332ca@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Sep 2016 14:18:14 -0300, Fabio Estevam wrote:

>  config BR2_LINUX_KERNEL_LATEST_VERSION
> -	bool "Latest version (4.7.3)"
> +	bool "Latest version (4.8-rc5)"

We never make this version point to a Linux release candidate, we use
the latest stable version available.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

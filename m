From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 23:25:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi-addon-xvdr: mark as
 deprecated
In-Reply-To: <1461518645-4761-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461518645-4761-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160424232559.5a0d0e7b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Apr 2016 19:24:05 +0200, Bernd Kuhls wrote:

>  config BR2_PACKAGE_KODI_ADDON_XVDR
>  	bool "kodi-addon-xvdr"
> +	depends on BR2_DEPRECATED_SINCE_2016_05

I've added a quick note above this dependency that quickly explains why
it's deprecated, and I've applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

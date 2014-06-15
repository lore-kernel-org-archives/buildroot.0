From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Jun 2014 08:54:24 +0200
Subject: [Buildroot] [PATCH 1/2] wpa_supplicant: disable for avr32
In-Reply-To: <8a8b1c998ef9cf581c4e0b442da6f3e18e3c57bb.1402814913.git.baruch@tkos.co.il>
References: <8a8b1c998ef9cf581c4e0b442da6f3e18e3c57bb.1402814913.git.baruch@tkos.co.il>
Message-ID: <20140615085424.46c9a5b8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 15 Jun 2014 09:48:32 +0300, Baruch Siach wrote:

>  config BR2_PACKAGE_WPA_SUPPLICANT
>  	bool "wpa_supplicant"
>  	help
> +	depends on !BR2_avr32 # no epoll_create1

With this change, isn't the "depends on" thing part of the help text? I
believe it should appear before the help section.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 14:52:01 +0100
Subject: [Buildroot] [PATCH 6/7] package/sdl_sound: add optional support
 for libmodplug
In-Reply-To: <1456051888-2047-6-git-send-email-bernd.kuhls@t-online.de>
References: <1456051888-2047-1-git-send-email-bernd.kuhls@t-online.de>
 <1456051888-2047-6-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221145201.3c1cf5c3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 11:51:27 +0100, Bernd Kuhls wrote:

> +ifeq ($(BR2_PACKAGE_LIBMODPLUG),y)
> +SDL_SOUND_DEPENDENCIES += libmodplug
> +endif

Please use the --enable/--disable options, thanks! :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

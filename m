From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 22:11:04 +0100
Subject: [Buildroot] [PATCH v3 7/7] package/tvheadend: Add transcoding
 support by ffmpeg
In-Reply-To: <1413311309-30811-7-git-send-email-bernd.kuhls@t-online.de>
References: <1413311309-30811-1-git-send-email-bernd.kuhls@t-online.de>
 <1413311309-30811-7-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141028221104.35a56dd4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 14 Oct 2014 20:28:29 +0200, Bernd Kuhls wrote:

>  ifeq ($(BR2_PACKAGE_LIBDVBCSA),y)
>  TVHEADEND_DEPENDENCIES += libdvbcsa
>  TVHEADEND_CONF_OPTS += --enable-dvbcsa
> @@ -38,6 +45,7 @@ define TVHEADEND_CONFIGURE_CMDS
>  	 --python="$(HOST_DIR)/usr/bin/python"	\
>  	 --disable-dvbscan			\
>  	 --enable-bundle			\
> +	 --disable-libffmpeg_static		\

Maybe I haven't looked properly, but I don't see this option supported
by tvheadend configure script. Can you check?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

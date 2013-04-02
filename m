From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Tue, 2 Apr 2013 07:08:22 +0200
Subject: [Buildroot] [PATCH] vlc: new package
References: <1363687526-8469-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <64pdjk.r2d.ln@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Alexey Brodkin <Alexey.Brodkin@synopsys.com>
wrote in news:1363687526-8469-1-git-send-email-abrodkin at synopsys.com: 

> +ifeq ($(BR2_PACKAGE_AVCODEC),y)

shouldn?t this be called BR2_PACKAGE_VLC_AVCODEC?

> +ifeq ($(BR2_PACKAGE_LUA),y)

and this BR2_PACKAGE_VLC_LUA?

Regards, Bernd

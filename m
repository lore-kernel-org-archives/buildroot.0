From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 17 May 2016 22:53:14 +0200
Subject: [Buildroot] [PATCH 1/1] kodi: fix build
	when	BR2_PACKAGE_LIBFSLVPUWRAP=y
References: <1463500440-25200-1-git-send-email-sebastien.szymanski@armadeus.com>
Message-ID: <qucs0dxan9.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi S?bastien,

Am Tue, 17 May 2016 17:54:00 +0200 schrieb S?bastien Szymanski:

> Note: I had to install .py files to test Kodi on my target (APF6D) with
> BR2_PACKAGE_PYTHON_PY_PYC otherwise Kodi complained that it couldn't
> find site.py and crashed at startup.

please post your defconfig to help reproduce the problem. I remember Yann 
said something similar about a year ago.

> +KODI_DEPENDENCIES += imx-gpu-viv libfslvpuwrap linux

What happens if no kernel package is enabled? I have no contact with the 
i.MX platform besides seeing regular commits for it in OpenELEC so I am 
at a loss here ;)

Regards, Bernd

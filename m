From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 02 Apr 2018 10:29:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/openvpn: bump version to 2.4.5,
 needs OpenSSL
References: <20180402081327.22491-1-bernd.kuhls@t-online.de>
Message-ID: <s869pex92c.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 02 Apr 2018 10:13:27 +0200 schrieb Bernd Kuhls:

> Changelog: https://community.openvpn.net/openvpn/wiki/ChangesInOpenvpn24
> 
> While building this defconfig
> 
> BR2_PACKAGE_LIBRESSL=y BR2_PACKAGE_OPENVPN=y
> 
> worked with OpenVPN 2.4.4, it is now broken:

Hi,

please do not apply this patch, it appears that bumping libressl to 2.7.2 
fixes the problem, but I need some time to investigate further.

Regards, Bernd

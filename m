From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 22:51:04 +0200
Subject: [Buildroot] [PATCH 1/1] xserver_xorg-server: Change default to
	X.org modular server on supported platforms
References: <1413744694-27659-1-git-send-email-bernd.kuhls@t-online.de>
 <20141019224639.2a61c29a@free-electrons.com>
Message-ID: <XnsA3CBE87438ACDberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20141019224639.2a61c29a at free-electrons.com:

>> +     default BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR if (BR2_LARGEFILE && 
BR2_INSTALL_LIBSTDCPP)
>>       default BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
> 
> While I don't object to changing to the modular server by default, I
> find it weird to have a default that is different depending on the
> toolchain configuration.

Hi,

the modular server depends on BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP, so I 
thought changing the default should be done only on supported archs. Is there 
a different possibility supported by Kconfig?

Regards, Bernd

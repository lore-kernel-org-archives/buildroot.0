From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 22:44:05 +0200
Subject: [Buildroot] [PATCH 1/2] package/kodi-inputstream-rtmp: new
 package
In-Reply-To: <20170716143518.31325-1-bernd.kuhls@t-online.de>
References: <20170716143518.31325-1-bernd.kuhls@t-online.de>
Message-ID: <20170722224405.77cc3fcf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Jul 2017 16:35:17 +0200, Bernd Kuhls wrote:

> +KODI_INPUTSTREAM_RTMP_VERSION = v1.0.4
> +KODI_INPUTSTREAM_RTMP_SITE = $(call github,notspiff,inputstream.rtmp,$(KODI_INPUTSTREAM_RTMP_VERSION))
> +KODI_INPUTSTREAM_RTMP_LICENSE = GPLv2+

You forgot to use the SPDX code for the license, so I've fixed that and
applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

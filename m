From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 16:06:35 +0100
Subject: [Buildroot] [PATCH/next 29/31]
 package/kodi-adsp-biquad-filters: new package
In-Reply-To: <1456006176-21308-30-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
 <1456006176-21308-30-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160305160635.71ed37eb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 20 Feb 2016 23:09:34 +0100, Bernd Kuhls wrote:

> +KODI_ADSP_BIQUAD_FILTERS_VERSION = 71087c48bb655b4539fdb2f367f7f7d820bdb1d6
> +KODI_ADSP_BIQUAD_FILTERS_SITE = $(call github,kodi-adsp,adsp.biquad.filters,$(KODI_ADSP_BIQUAD_FILTERS_VERSION))
> +KODI_ADSP_BIQUAD_FILTERS_LICENSE = GPLv2+
> +KODI_ADSP_BIQUAD_FILTERS_LICENSE_FILES = LICENSE.md

I have a problem with this one. LICENSE.md is the text of the GPLv3,
but the source files say GPLv2+.

Could you report a bug upstream, and sort out this license issue, and
then resubmit this package once the issue is resolved ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 22:49:28 +0200
Subject: [Buildroot] [PATCH/RFC v2 00/44] package/kodi: bump version to
 15.0 Beta2 Isengard
In-Reply-To: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150614224928.09fbe545@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 14 Jun 2015 16:35:59 +0200, Bernd Kuhls wrote:

> The Kodi project is preparing its next release 15.0, called Isengard.
> This patch series introduces two new dependencies, libsquish and libplatform.
> The pvr-addons were split into seperate repositories, so the current
> package kodi-pvr-addons is removed.
> Also audio codecs, which are not part of ffmpeg, were removed from Kodi
> and are now provided as seperate addons.

When is the final 15.0 release expected? I.e, should we consider these
patches for Buildroot 2015.08 (if Kodi 15.0 gets released before), or
not?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

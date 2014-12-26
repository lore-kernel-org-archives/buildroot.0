From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Dec 2014 18:22:51 +0100
Subject: [Buildroot] [PATCH v9 03/18] package/ffmpeg: Add Kodi patchset
In-Reply-To: <1419356801-31525-4-git-send-email-bernd.kuhls@t-online.de>
References: <1419356801-31525-1-git-send-email-bernd.kuhls@t-online.de>
 <1419356801-31525-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141226182251.79d06670@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 23 Dec 2014 18:46:26 +0100, Bernd Kuhls wrote:
> In the past xbmc delivered its own ffmpeg source code with specific patches to
> address bugs found during the use of xbmc. For Helix the ffmpeg source code was
> removed, Helix uses a vanilla ffmpeg source tarball and applies this patchset
> on top of it.
> 
> Downloaded from
> https://github.com/xbmc/FFmpeg/compare/FFmpeg:release/2.5...release/2.5-xbmc.patch
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I am wondering, wouldn't it be easier to have the individual patches,
instead of one big patch that combines all the XBMC patches?

Also, have those patches been submitted upstream? Why is there an XBMC
patch set, instead of patches submitted to upstream ffmpeg? Can we
expect this patch series to reduce in size over time?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 22:33:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.77
In-Reply-To: <20170404212302.9793-1-bernd.kuhls@t-online.de>
References: <20170404212302.9793-1-bernd.kuhls@t-online.de>
Message-ID: <20170406223304.7e2ecb6f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Apr 2017 23:23:02 +0200, Bernd Kuhls wrote:
> Added md5, sha1 & sha512 hashes.

Why? Having four hashes is not very useful. So I've kept only the
sha512 hash.

> Removed patch 0003, applied upstream:
> https://cgit.freedesktop.org/mesa/drm/commit/?id=6796859fcce7b9d7157f066a8b0dac3ede6438dd
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0003-tests-etnaviv-link-against-libdrm.patch   | 31 ----------------------
>  package/libdrm/libdrm.hash                         |  7 +++--
>  package/libdrm/libdrm.mk                           |  2 +-
>  3 files changed, 6 insertions(+), 34 deletions(-)
>  delete mode 100644 package/libdrm/0003-tests-etnaviv-link-against-libdrm.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

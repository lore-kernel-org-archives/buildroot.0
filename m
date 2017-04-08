From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 15:21:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/libpciaccess: bump version to
 0.13.5
In-Reply-To: <20170408084406.2881-1-bernd.kuhls@t-online.de>
References: <20170408084406.2881-1-bernd.kuhls@t-online.de>
Message-ID: <20170408152110.60c99aa0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  8 Apr 2017 10:44:06 +0200, Bernd Kuhls wrote:
> Add additional md5, sha1 & sha256 hashes according to buildroot docs:
> http://buildroot.uclibc.org/downloads/manual/manual.html#adding-packages-hash
> 
> > If upstream provides more than one type of hash (e.g. sha1 and sha512),
> > then it is best to add all those hashes in the .hash file.  
> 
> Removed patch 0001, applied upstream:
> https://cgit.freedesktop.org/xorg/lib/libpciaccess/commit/?id=6bd2f7f92eae713663f4e13f6e2cb23526607b8c
> 
> Renumbered remaining patch.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libpciaccess/0001-limits_h.patch           | 22 ----------------------
>  .../{0002-musl-arm.patch => 0001-musl-arm.patch}   |  0
>  package/libpciaccess/libpciaccess.hash             |  7 +++++--
>  package/libpciaccess/libpciaccess.mk               |  2 +-
>  4 files changed, 6 insertions(+), 25 deletions(-)
>  delete mode 100644 package/libpciaccess/0001-limits_h.patch
>  rename package/libpciaccess/{0002-musl-arm.patch => 0001-musl-arm.patch} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

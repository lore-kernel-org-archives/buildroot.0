From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 22:55:12 +0100
Subject: [Buildroot] [PATCH 1/2] openntpd: update to 6.2p3
In-Reply-To: <20171108130459.25412-1-aduskett@gmail.com>
References: <20171108130459.25412-1-aduskett@gmail.com>
Message-ID: <20171122225512.04c05ba8@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Nov 2017 08:04:58 -0500, Adam Duskett wrote:
> Other changes:
>   - Remove upstream patch.
>   - change locally computed hash to hash from the SHA256 URL.
>   - Add sha256sum for license file.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  ...-Revert-use-__dead-macro-from-sys-cdefs.h.patch | 91 ----------------------
>  .../{0002-fix-musl.patch => 0001-fix-musl.patch}   |  0
>  package/openntpd/openntpd.hash                     |  5 +-
>  package/openntpd/openntpd.mk                       |  2 +-
>  4 files changed, 5 insertions(+), 93 deletions(-)
>  delete mode 100644 package/openntpd/0001-Revert-use-__dead-macro-from-sys-cdefs.h.patch
>  rename package/openntpd/{0002-fix-musl.patch => 0001-fix-musl.patch} (100%)

Applied to next, after updating the comment that explains why
AUTORECONF = YES is needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 8 Nov 2017 15:31:19 +0200
Subject: [Buildroot] [PATCH 1/2] openntpd: update to 6.2p3
In-Reply-To: <20171108130459.25412-1-aduskett@gmail.com>
References: <20171108130459.25412-1-aduskett@gmail.com>
Message-ID: <20171108133119.5f3vd7d2owvvtevc@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Wed, Nov 08, 2017 at 08:04:58AM -0500, Adam Duskett wrote:
> Other changes:
>   - Remove upstream patch.

I think you can drop the AUTORECONF as well.

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

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

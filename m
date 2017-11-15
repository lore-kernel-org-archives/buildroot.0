From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Nov 2017 22:04:05 +0100
Subject: [Buildroot] [PATCH v2] genimage: change upstream URL
In-Reply-To: <20171115181435.5925-1-vivien.didelot@savoirfairelinux.com>
References: <20171115181435.5925-1-vivien.didelot@savoirfairelinux.com>
Message-ID: <20171115220405.3efbb881@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Nov 2017 13:14:35 -0500, Vivien Didelot wrote:
> Pengutronix is now hosting the official genimage repository and release
> tarballs on Github. This patch updates the official URL from the package
> description and its download website described in GENIMAGE_SITE.
> 
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> ---
>  package/genimage/Config.in.host | 2 +-
>  package/genimage/genimage.mk    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

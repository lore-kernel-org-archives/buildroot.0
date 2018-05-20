From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 18:45:49 +0200
Subject: [Buildroot] [PATCH 1/1] oprofile: bump to version 1.2.0
In-Reply-To: <20180520150319.4255-1-fontaine.fabrice@gmail.com>
References: <20180520150319.4255-1-fontaine.fabrice@gmail.com>
Message-ID: <20180520184549.61fd4c4e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 May 2018 17:03:19 +0200, Fabrice Fontaine wrote:
> - Remove second patch (already in version)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0002-Fix-FTBFS-problem-with-GCC-6.patch        | 51 ----------------------
>  package/oprofile/oprofile.hash                     |  9 ++--
>  package/oprofile/oprofile.mk                       |  2 +-
>  3 files changed, 7 insertions(+), 55 deletions(-)
>  delete mode 100644 package/oprofile/0002-Fix-FTBFS-problem-with-GCC-6.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

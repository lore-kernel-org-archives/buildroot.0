From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 23:55:07 +0200
Subject: [Buildroot] [PATCH 1/1] librtlsdr: bump to version 0.6.0
In-Reply-To: <20180827215503.25709-1-fontaine.fabrice@gmail.com>
References: <20180827215503.25709-1-fontaine.fabrice@gmail.com>
Message-ID: <20180828235507.468a4841@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Aug 2018 23:55:03 +0200, Fabrice Fontaine wrote:
> Remove second patch (already in version even if PR has not been closed):
> see
> https://github.com/steve-m/librtlsdr/commit/9047eef701f50d8bc4748233a31d65a0519ed86c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...x-builds-with-newer-compilers-C-standards.patch | 68 ----------------------
>  package/librtlsdr/librtlsdr.hash                   |  2 +-
>  package/librtlsdr/librtlsdr.mk                     |  2 +-
>  3 files changed, 2 insertions(+), 70 deletions(-)
>  delete mode 100644 package/librtlsdr/0002-fix-builds-with-newer-compilers-C-standards.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

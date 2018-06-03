From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 3 Jun 2018 20:23:12 +0200
Subject: [Buildroot] [PATCH v2,1/1] librtlsdr: fix static build
In-Reply-To: <20180603141751.5723-1-fontaine.fabrice@gmail.com>
References: <20180603141751.5723-1-fontaine.fabrice@gmail.com>
Message-ID: <20180603202312.23f4e3eb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Jun 2018 16:17:51 +0200, Fabrice Fontaine wrote:
> When bumping to version 0.5.4, first patch was wrongly removed.
> Put back an enhanced version of this patch (sent upstream)
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/bea78bf580be6fe109b827b72af9587c5324daad
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Set -DBUILD_STATIC_LIBS as it is not done by pkg-cmake

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

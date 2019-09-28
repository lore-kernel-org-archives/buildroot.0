From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 21:47:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/minimodem: add BR2_PACKAGE_FFTW
 select
In-Reply-To: <20190928185444.21791-1-fontaine.fabrice@gmail.com>
References: <20190928185444.21791-1-fontaine.fabrice@gmail.com>
Message-ID: <20190928214733.07341a67@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Sep 2019 20:54:44 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes following warning:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_FFTW_SINGLE
>   Depends on [n]: BR2_PACKAGE_FFTW [=n]
>   Selected by [y]:
>   - BR2_PACKAGE_MINIMODEM [=y]
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/minimodem/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

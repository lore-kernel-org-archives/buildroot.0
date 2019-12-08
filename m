From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 16:54:19 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/systemd: bump to version 244
In-Reply-To: <20191205235027.3311948-1-aduskett@gmail.com>
References: <20191205235027.3311948-1-aduskett@gmail.com>
Message-ID: <20191208165419.31d0e265@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  5 Dec 2019 15:50:27 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Other changes:
>   - Update hash for README due to added licence directory tools/chromiumos.
>   - Add hash for tools/chromiumos/LICENSE
>   - Added BSD-3-Clause (tools/chromiumos) in systemd.mk due to the new
>     tools/chromiumos directory.
>   - Added tools/chromiumos/LICENSE to SYSTEMD_LICENSE_FILES in systemd.mk
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Fixed license formatting (Thomas)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

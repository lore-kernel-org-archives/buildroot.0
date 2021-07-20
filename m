From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 20:26:28 +0200
Subject: [Buildroot] [PATCH v2] package/cegui: disable Python SWIG
 extension modules unconditionally
In-Reply-To: <20210720181048.7015-1-b.bilas@grinn-global.com>
References: <20210720181048.7015-1-b.bilas@grinn-global.com>
Message-ID: <20210720202628.755f6b99@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 20 Jul 2021 20:10:48 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> It seems that Python SWIG extension module(s) are not compatible with
> buildroot's SWIG version so disable them unconditionally to fix
> the following build errors:
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/f80/f80ebdcbde08c13eddec9fadc39b9c2bd4b83e94//
> 
>   and more...
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
> Changes v1 -> v2:
>  - disable CEGUI_BUILD_PYTHON_MODULES_SWIG option unconditionally

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

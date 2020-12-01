From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Dec 2020 22:51:26 +0100
Subject: [Buildroot] [PATCH/next v1] package/kmsxx: bump version to
 5489056 and convert to meson build
In-Reply-To: <20201129175633.388-1-ps.report@gmx.net>
References: <20201129175633.388-1-ps.report@gmx.net>
Message-ID: <20201201225126.6651a1e1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Nov 2020 18:56:33 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - remove 0001-fix-compiler-errors-with-gcc-10.patch
>   (upstream)
> 
> - remove 0002-added-include-string-to-card.h-to-follow-gcc10-porti.patch
>   (upstream)
> 
> - convert to meson
> 
> - add patch to use system fmt instead of git submodule (fixes
>   configure 'ERROR: Include dir ext/fmt/include does not exist.')
> 
> - add patch to use system pybind11 instead of git submodule (fixes
>   configure 'ERROR: Include dir ext/pybind11/include does not exist.')
> 
> - add patch to use python only if pykms is enabled (fixes
>   configure 'ERROR: Dependency "pybind11" not found, tried pkgconfig')
> 
> - add optional libevdev dependency (needed for utils/kmstouch)
> 
> - update LICENSE file hash (replaced short copyright notice and
>   link to  http://mozilla.org/MPL/2.0/ with complete license text)
> 
> - lift toolchain headers requirement to at least 4.11 (include
>   linux/dma-buf.h)
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:
>   - needs https://patchwork.ozlabs.org/project/buildroot/patch/20201129093823.10286-1-ps.report at gmx.net/

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

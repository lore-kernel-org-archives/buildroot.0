From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Oct 2020 22:57:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/libraw: security bump to
 version 0.20.2
In-Reply-To: <20201019213427.790231-1-fontaine.fabrice@gmail.com>
References: <20201019213427.790231-1-fontaine.fabrice@gmail.com>
Message-ID: <20201024225723.794a237f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 19 Oct 2020 23:34:27 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2020-24890: libraw 20.0 has a null pointer dereference
> vulnerability in parse_tiff_ifd in src/metadata/tiff.cpp, which may
> result in context-dependent arbitrary code execution.
> 
> https://www.libraw.org/news/libraw-0-20-2-Release
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libraw/libraw.hash | 2 +-
>  package/libraw/libraw.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

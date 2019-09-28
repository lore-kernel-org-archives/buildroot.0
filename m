From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 23:32:23 +0200
Subject: [Buildroot] [PATCH 4/4] package/cog: bump to version 0.4.0
In-Reply-To: <20190920213826.2531495-5-aperez@igalia.com>
References: <20190920213826.2531495-1-aperez@igalia.com>
 <20190920213826.2531495-5-aperez@igalia.com>
Message-ID: <20190928233223.225ad81b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 21 Sep 2019 00:38:26 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> This is a new major release, to be used along with WPE WebKit 2.26.0
> as per the compatibility matrix:
> 
>   https://wpewebkit.org/release/schedule/#compatible-components
> 
> The release includes experimental support for DRM/KMS output, which is
> explicitly disabled at the moment. The complete release notes are
> available at:
> 
>   https://wpewebkit.org/release/cog-0.4.0.html
> 
> Starting with the 0.4.x series, Cog is available directly from the
> main WPE WebKit site, and this COG_SITE is changd accordingly.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/cog/cog.hash | 8 ++++----
>  package/cog/cog.mk   | 5 +++--
>  2 files changed, 7 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

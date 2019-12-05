From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 22:52:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/libepoxy: bump to version 1.5.4
In-Reply-To: <20191204124950.998118-1-aperez@igalia.com>
References: <20191204124950.998118-1-aperez@igalia.com>
Message-ID: <20191205225245.1bbca518@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  4 Dec 2019 14:49:50 +0200
Adrian Perez de Castro <aperez@igalia.com> wrote:

> This release contains two minor improvements (smaller library size, and
> updates to the GL registry), plus a couple of build fixes which are not
> relevant for Buildroot (one for Solaris; another for unit tests, which
> we do not build):
> 
>   https://github.com/anholt/libepoxy/releases/tag/1.5.4
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/libepoxy/libepoxy.hash | 4 ++--
>  package/libepoxy/libepoxy.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

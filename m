From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Aug 2019 15:59:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpebackend-fdo: bump to version
 1.2.2
In-Reply-To: <20190819121058.26798-1-aperez@igalia.com>
References: <20190819121058.26798-1-aperez@igalia.com>
Message-ID: <20190819155935.136ade6a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adrian,

On Mon, 19 Aug 2019 15:10:58 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> This is a bugfix release which solves an underlinking issue, which would
> prevent building in some situations (for example, when --no-undefined is
> passed to the linker). Release notes:
> 
>   https://wpewebkit.org/release/wpebackend-fdo-1.2.2.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
>  package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

Here as well, it's a single simple commit that fixes some potential
build issues, so I've applied to master, even though it's a version
bump.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 May 2020 23:03:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-argon2-cffi: bump to
 version 20.1.0
In-Reply-To: <20200511073805.93566-1-james.hilliard1@gmail.com>
References: <20200511073805.93566-1-james.hilliard1@gmail.com>
Message-ID: <20200515230347.1aa44f90@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 May 2020 01:38:05 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop patch that is now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...-ARGON2_CFFI_USE_SSE2-to-override-ss.patch | 78 -------------------
>  .../python-argon2-cffi.hash                   |  6 +-
>  .../python-argon2-cffi/python-argon2-cffi.mk  |  4 +-
>  3 files changed, 5 insertions(+), 83 deletions(-)
>  delete mode 100644 package/python-argon2-cffi/0001-Add-env-variable-ARGON2_CFFI_USE_SSE2-to-override-ss.patch

The changes between 19.2.0 and 20.1.0 are pretty much "side things",
except for your patch fixing the SSE2 issue. So I've applied this
version bump to master.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 16:30:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-argon2-cffi: only enable
 sse2 when supported
In-Reply-To: <20200507203901.97715-1-james.hilliard1@gmail.com>
References: <20200507203901.97715-1-james.hilliard1@gmail.com>
Message-ID: <20200509163020.232ddd15@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  7 May 2020 14:39:01 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> We need to backport a commit so that we can enable/disable sse2 using
> the ARGON2_CFFI_USE_SSE2 env variable.
> 
> Fixes:
> http://autobuild.buildroot.net/results/030/0306d66d081dd0807c577edd50d39075a46d0dd9/build-end.log
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...-ARGON2_CFFI_USE_SSE2-to-override-ss.patch | 78 +++++++++++++++++++
>  .../python-argon2-cffi/python-argon2-cffi.mk  |  6 ++
>  2 files changed, 84 insertions(+)
>  create mode 100644 package/python-argon2-cffi/0001-Add-env-variable-ARGON2_CFFI_USE_SSE2-to-override-ss.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

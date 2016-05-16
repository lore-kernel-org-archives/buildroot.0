From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 May 2016 22:05:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/nginx: corrected patch subject
In-Reply-To: <1463388471-27444-1-git-send-email-martin@barkynet.com>
References: <1463388471-27444-1-git-send-email-martin@barkynet.com>
Message-ID: <20160516220525.1ae3de43@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 May 2016 09:47:51 +0100, Martin Bark wrote:
> Changed [PATCH x/y] to [PATCH] at the beginning of the subject line
> since the numbering is meaningless.
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  .../0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch     | 2 +-
>  .../0002-auto-feature-add-mechanism-allowing-to-force-feature.patch     | 2 +-
>  .../0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch     | 2 +-
>  package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch           | 2 +-
>  .../nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch    | 2 +-
>  package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch           | 2 +-
>  package/nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch             | 2 +-
>  .../0008-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch     | 2 +-
>  8 files changed, 8 insertions(+), 8 deletions(-)

We normally don't apply such patches to master since it's not a bug
fix. However, it won't apply to next since the nginx patches are only
on master. And it's obviously a patch that cannot cause any issue by
itself. So I've applied to master, as an exception.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

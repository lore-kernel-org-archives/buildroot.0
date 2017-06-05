From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 10:55:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 8.0.0
In-Reply-To: <1496614561-15136-1-git-send-email-martin@barkynet.com>
References: <1496614561-15136-1-git-send-email-martin@barkynet.com>
Message-ID: <20170605105558.31d0bb2c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Jun 2017 23:16:01 +0100, Martin Bark wrote:
> See https://nodejs.org/en/blog/release/v8.0.0/
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  .../nodejs/0002-add-missing-stdarg-includes.patch  | 34 ++++++++++++++++
>  ...-HAVE_OPENSSL-directive-to-openssl_config.patch | 47 ----------------------
>  package/nodejs/nodejs.hash                         |  4 +-
>  package/nodejs/nodejs.mk                           |  2 +-
>  4 files changed, 37 insertions(+), 50 deletions(-)
>  create mode 100644 package/nodejs/0002-add-missing-stdarg-includes.patch
>  delete mode 100644 package/nodejs/0002-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

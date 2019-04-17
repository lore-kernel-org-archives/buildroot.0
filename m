From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 08:47:24 +0200
Subject: [Buildroot] [PATCH v3] package/php: fix how external PCRE2 JIT
 is enabled
In-Reply-To: <20190416160323.18514-1-panfilov.artyom@gmail.com>
References: <20190416160323.18514-1-panfilov.artyom@gmail.com>
Message-ID: <20190417084724.4b416085@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Apr 2019 19:03:23 +0300
Artem Panfilov <panfilov.artyom@gmail.com> wrote:

> This patch adds ac_cv_have_pcre2_jit cache variable to avoid
> the tests running on the host system during cross-compiling.
> 
> Signed-off-by: Artem Panfilov <panfilov.artyom@gmail.com>
> 
> ---
> Changes v1 -> v2:
>  - add autoconf cache variable (suggested by Thomas Petazzoni)
> Changes v2 -> v3:
>  - backport upstream patch (suggested by Arnout Vandecappelle)
> ---
>  ....m4-add-ac_cv_have_pcre2_jit-variabl.patch | 91 +++++++++++++++++++
>  package/php/php.mk                            |  9 ++
>  2 files changed, 100 insertions(+)
>  create mode 100644 package/php/0006-ext-pcre-config0.m4-add-ac_cv_have_pcre2_jit-variabl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

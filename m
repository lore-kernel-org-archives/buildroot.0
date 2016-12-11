From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 18:04:20 +0100
Subject: [Buildroot] [PATCH] doc/manual: document the new waf-package
 infra variables
In-Reply-To: <1481469015-31089-1-git-send-email-romain.naour@gmail.com>
References: <1481469015-31089-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161211180420.768436d3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Dec 2016 16:10:15 +0100, Romain Naour wrote:
> Document LIBFOO_WAF_OPTS, LIBFOO_BUILD_OPTS,
> LIBFOO_INSTALL_STAGING_OPTS and LIBFOO_INSTALL_TARGET_OPTS.
> 
> Also document LIBFOO_CONF_OPTS which was missing in waf-package
> reference.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  docs/manual/adding-packages-waf.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Applied to master, with some minor rewording. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Mar 2020 20:39:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson.mk: Fix
 cross-compilation.conf
In-Reply-To: <20200311191141.16295-1-glex.spb@gmail.com> (Gleb Mazovetskiy's
 message of "Wed, 11 Mar 2020 19:11:41 +0000")
References: <20200311105930.21564-1-glex.spb@gmail.com>
 <20200311191141.16295-1-glex.spb@gmail.com>
Message-ID: <87fte15wh0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gleb" == Gleb Mazovetskiy <glex.spb@gmail.com> writes:

 > $$(STAGING_DIR) -> $(STAGING_DIR) in PKG_MESON_INSTALL_CROSS_CONF.
 > $$ resulted in `$(STAGING_DIR)` in the file instead of the expanded
 > value.

 > Note that this change only affects the etc config at:
 > host/etc/meson/cross-compilation.conf

 > Per-package cross-compilation.conf files are already correct.

 > Reviewed-by: Peter Seiderer <ps.report@gmx.net>
 > Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard

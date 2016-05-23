From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 17:04:24 +0200
Subject: [Buildroot] [PATCH next] lftp: bump version to 4.7.2
In-Reply-To: <1463999236-8470-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1463999236-8470-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160523170424.0977eee4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 May 2016 11:27:16 +0100, Vicente Olivert Riera wrote:

> +# Help lftp finding readline
> +LFTP_CONF_OPTS += --with-readline=$(STAGING_DIR)/usr
> +LFTP_CONF_OPTS += --with-readline-inc=$(STAGING_DIR)/usr/include/readline
> +LFTP_CONF_OPTS += --with-readline-lib=$(STAGING_DIR)/usr/lib
> +
> +# Help lftp finding zlib
> +LFTP_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr

We typically prefer one single LFTP_CONF_OPTS assignment in such
situations, so I've fixed that up and applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

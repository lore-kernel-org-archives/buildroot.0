From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Sep 2010 19:03:26 +0200
Subject: [Buildroot] [PATCH 09/21] gmp: bump to 5.0.1
In-Reply-To: <1284435648-15238-9-git-send-email-Martin.Banky@gmail.com>
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
	<1284435648-15238-9-git-send-email-Martin.Banky@gmail.com>
Message-ID: <20100918190326.40e2090d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Sep 2010 20:40:36 -0700
Martin Banky <martin.banky@gmail.com> wrote:

> +	(cd $(GMP_TARGET_DIR); rm -rf config.cache; cp $(GMP_DIR)/longlong.h $(GMP_DIR)/gmp-impl.h ./; \

Why ? Even if it's really needed, a little bit of explanation in the
commit log would help.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Jun 2021 22:48:12 +0200
Subject: [Buildroot] [PATCH 05/15] package/pkg-generic.mk: Perform .la
 files fixup in per-package HOST_DIR
In-Reply-To: <20210621141130.48654-6-herve.codina@bootlin.com>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-6-herve.codina@bootlin.com>
Message-ID: <20210621224812.4d089f26@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Jun 2021 16:11:20 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> fixup-libtool-files was called on per-package STAGING_DIR.
> Some host-xxxx packages have their .la files with directories
> pointing outside their own per-package directory.

Was this causing a practical issue, or is being done just to be cleaner?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

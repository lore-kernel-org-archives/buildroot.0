From: Herve Codina <herve.codina@bootlin.com>
Date: Tue, 22 Jun 2021 11:38:41 +0200
Subject: [Buildroot] [PATCH 05/15] package/pkg-generic.mk: Perform .la
 files fixup in per-package HOST_DIR
In-Reply-To: <20210621224812.4d089f26@windsurf>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-6-herve.codina@bootlin.com>
 <20210621224812.4d089f26@windsurf>
Message-ID: <20210622113841.400e31d6@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, 21 Jun 2021 22:48:12 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Mon, 21 Jun 2021 16:11:20 +0200
> Herve Codina <herve.codina@bootlin.com> wrote:
> 
> > fixup-libtool-files was called on per-package STAGING_DIR.
> > Some host-xxxx packages have their .la files with directories
> > pointing outside their own per-package directory.  
> 
> Was this causing a practical issue, or is being done just to be cleaner?
> 

I didn't see any practical issue on the builds I did and I didn't try to
find any use-case that leads to an issue.
So this patch is to be cleaner.

Herv? Codina

-- 
Herv? Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

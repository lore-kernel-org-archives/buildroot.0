From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Aug 2020 00:04:51 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/ima-evm-utils: bump version
 to 1.3
In-Reply-To: <20200727230050.20627-1-petr.vorel@gmail.com>
References: <20200727230050.20627-1-petr.vorel@gmail.com>
Message-ID: <20200806000451.36da3e61@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 Jul 2020 01:00:50 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> added tpm2-tss as dependency (needed for ima_boot_aggregate cmd for
> reading PCR; better to use libtss2-esys and libtss2-rc than require
> tsspcrread binary in runtime)
> 
> added also sha1 hash from sourceforge
> 
> added 2 patches fixing build (both are 1.3 specific)
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v2->v3:
> * squashed into single commit (both patches are 1.3 related)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

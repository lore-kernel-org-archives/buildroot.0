From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 May 2021 22:43:43 +0200
Subject: [Buildroot] [PATCH] Makefile: remove cpe-updates on clean
In-Reply-To: <20210516124237.489609-1-yann.morin.1998@free.fr>
References: <20210516124237.489609-1-yann.morin.1998@free.fr>
Message-ID: <20210517224343.781b9d75@windsurf.orange-hotspot>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 16 May 2021 14:42:37 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Commit fd7312940aef (Makefile: add new missing-cpe target) added the
> rule to generate a set of files to update the NVD.
> 
> For an in-tree build, 'make clean' remove the output directory, so
> those files are removed. But for an out-of-tree build, the output
> directory is not removed, so those files still linger around after a
> clean.
> 
> Explicitly remove them on clean, to cater for both cases.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Matthew Weber <matthew.weber@rockwellcollins.com>

Yes, indeed:

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

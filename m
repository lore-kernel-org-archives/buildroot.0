From: Weber, Matthew L                            Collins <Matthew.Weber@collins.com>
Date: Mon, 17 May 2021 15:43:46 +0000
Subject: [Buildroot] [PATCH] Makefile: remove cpe-updates on clean
In-Reply-To: <20210516124237.489609-1-yann.morin.1998@free.fr>
References: <20210516124237.489609-1-yann.morin.1998@free.fr>
Message-ID: <DM2P110MB0105B4F8077B066C87FF0F7AF22D9@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

> -----Original Message-----
> From: Yann E. MORIN <yann.morin.1998@gmail.com> On Behalf Of Yann E.
> MORIN
> Sent: Sunday, May 16, 2021 7:43 AM
> To: buildroot at buildroot.org
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>; Thomas Petazzoni
> <thomas.petazzoni@bootlin.com>; Weber, Matthew L Collins
> <Matthew.Weber@collins.com>
> Subject: [PATCH] Makefile: remove cpe-updates on clean
> 
> Commit fd7312940aef (Makefile: add new missing-cpe target) added the rule
> to generate a set of files to update the NVD.
> 
> For an in-tree build, 'make clean' remove the output directory, so those files
> are removed. But for an out-of-tree build, the output directory is not
> removed, so those files still linger around after a clean.
> 
> Explicitly remove them on clean, to cater for both cases.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Matthew Weber <matthew.weber@rockwellcollins.com>

Reviewed-by: Matthew Weber <matthew.weber@collins.com>

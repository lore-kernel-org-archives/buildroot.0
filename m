From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 1 Nov 2018 06:49:42 +0100
Subject: [Buildroot] [PATCH] merge_config.sh: Fix merging buildroot
 config files
In-Reply-To: <21d8edac1f6c42cba3b40671ef2d5c5a@SOC-EX01V.e01.socionext.com>
References: <20181031205608.GA4061@x230>
 <20181101010953.20996-1-afshin.nasser@gmail.com>
 <21d8edac1f6c42cba3b40671ef2d5c5a@SOC-EX01V.e01.socionext.com>
Message-ID: <20181101054941.GB8261@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.

> > This is actually an upstream patch [1] from linux/kbuild project.

> > [1]
> > https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild
> > .git/commit/?h=for-next&id=f6fe19e9d84400e1c9544c1909952c2c7c6a90a2


> Please refer to commit ID only after it gets stable in Linus' tree.

> I will end up with rebasing
> In order to drop some other commits causing a problem.
Make sense, thanks, Yamada!
Nasser, maybe use link to patch in patchwork.
I'd put this link also into the patch itself (IMHO good idea for faster
resolving when doing kconfig update in buildroot).
Once the patch gets into mainline, we can update the link.


Kind regards,
Petr

[1] https://patchwork.kernel.org/patch/10660207/

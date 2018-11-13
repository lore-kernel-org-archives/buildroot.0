From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 13 Nov 2018 19:35:55 +0100
Subject: [Buildroot] [PATCH v3 1/3] merge_config.sh: Fix merging
 buildroot config files
In-Reply-To: <20181113134404.32235-2-afshin.nasser@gmail.com>
References: <20181105083554.GC4485@x230>
 <20181113134404.32235-1-afshin.nasser@gmail.com>
 <20181113134404.32235-2-afshin.nasser@gmail.com>
Message-ID: <20181113183554.GB16826@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nasser,

> This patch allows us to define config prefix with CONFIG_ environment
> variable.

> By setting the proper config prefix, we will have proper 'redundant
> configuration warnings' when we use '-r -m' options.

> This is actually an upstream patch [1] from linux/kbuild project.

> [1] https://patchwork.kernel.org/patch/10660207/
This is actually already in mainline for v4.20-rc1:
2cd3faf87d2d8f6123adf34741b9a7b98828a76f
("merge_config.sh: Allow to define config prefix")

> Signed-off-by: Nasser Afshin <afshin.nasser@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr

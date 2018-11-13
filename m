From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 13 Nov 2018 19:38:16 +0100
Subject: [Buildroot] [PATCH v3 3/3] merge_config.sh: Avoid false
 positive matches from comment lines
In-Reply-To: <20181113134404.32235-4-afshin.nasser@gmail.com>
References: <20181105083554.GC4485@x230>
 <20181113134404.32235-1-afshin.nasser@gmail.com>
 <20181113134404.32235-4-afshin.nasser@gmail.com>
Message-ID: <20181113183815.GC16826@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nasser,

> From: Nasser Afshin <Afshin.Nasser@gmail.com>

> We are using empty CONFIG_PREFIX_. This results in false positive match
> for comment lines when merging config fragments.

> To avoid false positive reports, we use separate sed expressions and
> address comment lines explicitly.

> This is actually an upstream patch [1] from linux/kbuild project.

> [1] https://patchwork.kernel.org/patch/10667571/
And this one is in mainline as well (v4.20-rc2):
6bbe4385d035c6fac56f840a59861a0310ce137b
("kconfig: merge_config: avoid false positive matches from comment lines")

> Signed-off-by: Nasser Afshin <Afshin.Nasser@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>


Kind regards,
Petr

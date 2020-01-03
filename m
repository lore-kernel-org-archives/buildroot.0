From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 3 Jan 2020 16:21:49 +0100
Subject: [Buildroot] [PATCH 02/11] support/scripts/pkg-stats: store pkg
 dir path
In-Reply-To: <20200103151849.10956-3-heiko.thiery@gmail.com>
References: <20200103151849.10956-1-heiko.thiery@gmail.com>
 <20200103151849.10956-3-heiko.thiery@gmail.com>
Message-ID: <20200103162149.623d34ec@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  3 Jan 2020 16:18:39 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> @@ -732,6 +732,8 @@ def __main__():
>                                        'HEAD']).splitlines()[0]
>      print("Build package list ...")
>      packages = get_pkglist(args.npackages, package_list)
> +    print("Getting developers...")
> +    developers = parse_developers()
>      print("Getting package make info ...")
>      package_init_make_info()
>      print("Getting package details ...")

This chunk doesn't seem to be related to this patch.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 3 Jun 2017 16:58:39 -0300
Subject: [Buildroot] [PATCH] package/uboot-tools: revert the removal of
	0001-drop-configh-from-tools.patch
In-Reply-To: <20170603172410.17504-1-romain.naour@gmail.com>
References: <20170603172410.17504-1-romain.naour@gmail.com>
Message-ID: <CAOMZO5Cs-Tqkkye7_GFtjDUWHOM1HHy5H39did8MM9=15HH8yw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 3, 2017 at 2:24 PM, Romain Naour <romain.naour@gmail.com> wrote:
> Patch 0001-drop-configh-from-tools.patch is not upstream, instead it
> must be rebased on top of 2017.05 release since the code was moved by
> [1].
>
> Fixes:
> http://autobuild.buildroot.net/results/949/94910513d1b14e3b02ec4aed34de89d1b1d7a12a
>
> [1] http://git.denx.de/?p=u-boot.git;a=commit;h=9d80b49a671c9922931adcd823aab0ed319a42d1
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc:  Fabio Estevam <festevam@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>

Can't we have this patch upstreamed instead of keeping it in Buildroot?

Thanks

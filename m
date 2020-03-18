From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Mar 2020 23:19:32 +0100
Subject: [Buildroot] [PATCH] package/vim: bump to v8.2.0
In-Reply-To: <20200316094416.7274-1-joaomarcos.costa@bootlin.com>
References: <20200316094416.7274-1-joaomarcos.costa@bootlin.com>
Message-ID: <20200318231932.3a73a511@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 16 Mar 2020 10:44:16 +0100
Joao Marcos Costa <joaomarcos.costa@bootlin.com> wrote:

> Update from version 8.1.1929 to 8.2.0, which is the latest stable
> version. The license file ('README.txt') has only one modification,
> concerning Vim's version, as it is shown by the following diff:
> 
>    --- vim-8.1.1929/README.txt	2019-08-25 23:08:17.000000000 +0200
>    +++ vim-8.2.0000/README.txt	2019-12-12 14:18:35.000000000 +0100
>    @@ -1,4 +1,4 @@
>    -README.txt for version 8.1 of Vim: Vi IMproved.
>    +README.txt for version 8.2 of Vim: Vi IMproved.
> 
> Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>  package/vim/vim.hash | 4 ++--
>  package/vim/vim.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

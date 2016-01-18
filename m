From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jan 2016 13:51:00 +0100
Subject: [Buildroot] [PATCH] NVME Makefile update
In-Reply-To: <20160118081653.30513.53744.stgit@localhost.localdomain>
References: <20160118081653.30513.53744.stgit@localhost.localdomain>
Message-ID: <20160118135100.0bf8e476@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mamatha Inamdar,

On Mon, 18 Jan 2016 13:48:12 +0530, Mamatha Inamdar wrote:
> Makefile cleanup: remove -Werror flag in CFLAGS
> 
> Signed-off-by: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
> ---
>  Makefile |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index d0c0ce4..003928b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1,4 +1,4 @@
> -CFLAGS += -std=gnu99 -O2 -g -Wall -Werror
> +CFLAGS += -std=gnu99 -O2 -g -Wall
>  CPPFLAGS += -I $(SRC) -D_GNU_SOURCE
>  NVME = nvme
>  INSTALL ?= install

This needs to be part of your patch adding the nvme package, as a file
in package/nvme/.

See the numerous other examples in Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

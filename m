From: Gaye Abdoulaye Walsimou <walsimou@walsimou.com>
Date: Mon, 04 May 2009 10:00:49 +0200
Subject: [Buildroot] [PATCH] Add a .gitignore file
In-Reply-To: <49FEE4470200007000014C15@gwia.alliedtelesyn.co.nz>
References: <49FEE4470200007000014C15@gwia.alliedtelesyn.co.nz>
Message-ID: <49FEA0B1.8050602@walsimou.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

angus salkeld wrote:
> ---
>  .gitignore |   16 ++++++++++++++++
>  1 files changed, 16 insertions(+), 0 deletions(-)
>  create mode 100644 .gitignore
>
> diff --git a/.gitignore b/.gitignore
> new file mode 100644
> index 0000000..191e148
> --- /dev/null
> +++ b/.gitignore
> @@ -0,0 +1,16 @@
> +build_*
> +project_*
> +toolchain_*
> +binaries/*
> +.auto.deps
> +.config.cmd
> +.config.old
> +package/config/buildroot-config/
> +package/config/.depend
> +package/config/conf
> +package/config/mconf
> +package/config/*.o
> +package/config/lex.zconf.c
> +package/config/lxdialog/*.o
> +package/config/zconf.hash.c
> +package/config/zconf.tab.c
>   
Hello Angus,
I think it is better to add .gitignore file in each subdirectory. So if
a subdirectory comes to be changed, you don't have to modify the
.gitignore file in the root directory, and this avoids having a long
list of ignored files in .gitignore.
Other wise, yes, .gitignore files is a good idea.

Cheers,

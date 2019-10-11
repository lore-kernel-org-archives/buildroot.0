From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 Oct 2019 00:54:08 +0200
Subject: [Buildroot] [PATCH] package/vim: bump to version 1929
In-Reply-To: <20190830184034.26771-1-chrismcc@gmail.com>
References: <20190830184034.26771-1-chrismcc@gmail.com>
Message-ID: <ae6ab43d-5432-82e1-f16b-d7fc93002cc2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/08/2019 20:40, Christopher McCrory wrote:
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>

 Applied to master, thanks.


> ---
>  package/vim/vim.hash | 2 +-
>  package/vim/vim.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/vim/vim.hash b/package/vim/vim.hash
> index 9ec3dd0589..d85bd7760c 100644
> --- a/package/vim/vim.hash
> +++ b/package/vim/vim.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256 a6dab137949097fbe0b67aafedf4c24a3b0d9c41716db35f5beb4834924d7b00  vim-8.1.0133.tar.gz
> +sha256 4b7359a58a75c29d4a8fc7fcbb2ccab1d1dc0ede1c4c689b27cc049c17920278 vim-8.1.1929.tar.gz

 Could you also add a hash for the license file?

 Regards,
 Arnout

> diff --git a/package/vim/vim.mk b/package/vim/vim.mk
> index 5a5408ff6b..5cb4e1b4cc 100644
> --- a/package/vim/vim.mk
> +++ b/package/vim/vim.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -VIM_VERSION = 8.1.0133
> +VIM_VERSION = 8.1.1929
>  VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
>  VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
>  VIM_SUBDIR = src
> 

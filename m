From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sun, 23 Feb 2020 12:40:37 +0100
Subject: [Buildroot] [PATCH 2/4] package/libubootenv: bump version to
 git ba952d05ec9ab16029816a06d956bac7fb4e9832.
In-Reply-To: <20200223091803.1007790-2-mc5686@mclink.it>
References: <20200223091803.1007790-1-mc5686@mclink.it>
 <20200223091803.1007790-2-mc5686@mclink.it>
Message-ID: <98fdce20-94e9-6d4f-181b-2beea72bf63c@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mauro,

Le 23/02/2020 ? 10:18, Mauro Condarelli a ?crit?:
> It has bugfixes needed by swupdate.
> 
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>   package/libubootenv/libubootenv.hash | 2 +-
>   package/libubootenv/libubootenv.mk   | 3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
> index bde2ac3..383f550 100644
> --- a/package/libubootenv/libubootenv.hash
> +++ b/package/libubootenv/libubootenv.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256 332c45d46401f1859f0781fd0fd316bb1c251264674677c26a4d9b9e1c592719 libubootenv-879c0731fa0725785b9fa4499bbf6aacd04ee4c2.tar.gz
> +sha256 dc84eefd7dcde46e6754517be37dc0c5a6cd07d38db06564eb54acd9b9ff936e libubootenv-ba952d05ec9ab16029816a06d956bac7fb4e9832.tar.gz
>   sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 Licenses/lgpl-2.1.txt
> diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
> index 99cbd0d..3912fda 100644
> --- a/package/libubootenv/libubootenv.mk
> +++ b/package/libubootenv/libubootenv.mk
> @@ -4,7 +4,8 @@
>   #
>   ################################################################################
>   
> -LIBUBOOTENV_VERSION = 879c0731fa0725785b9fa4499bbf6aacd04ee4c2
> +#LIBUBOOTENV_VERSION = 879c0731fa0725785b9fa4499bbf6aacd04ee4c2
> +LIBUBOOTENV_VERSION = ba952d05ec9ab16029816a06d956bac7fb4e9832
>   LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,$(LIBUBOOTENV_VERSION))
>   LIBUBOOTENV_LICENSE = LGPL-2.1
>   LIBUBOOTENV_LICENSE_FILES = Licenses/lgpl-2.1.txt
> 

Thanks for the patch.

But in fact this bump was already applied on -next branch [1].

Regards,

[1] - 
https://git.buildroot.net/buildroot/commit/?h=next&id=11c87edde2eef60b56168df39520fe67555e3f59

-- 
Pierre-Jean Texier
Embedded Linux Engineer
https://koncepto.io

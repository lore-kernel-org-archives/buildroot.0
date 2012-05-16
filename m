From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 16 May 2012 19:02:20 +0200
Subject: [Buildroot] [PATCH v2 07/11] manual: rework the intro of
	customize-rootfs.txt
In-Reply-To: <1336905501-9757-8-git-send-email-s.martin49@gmail.com>
References: <4FAEEFA8.2070005@mind.be>
 <1336905501-9757-1-git-send-email-s.martin49@gmail.com>
 <1336905501-9757-8-git-send-email-s.martin49@gmail.com>
Message-ID: <CAAXf6LUPA-SFXN-R8SyQWiAKJHGDBqYKNCgp5zgripiz+ufz1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, May 13, 2012 at 12:38 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> From: Samuel MARTIN <s.martin49@gmail.com>
>
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
> index 123c97f..d067e31 100644
> --- a/docs/manual/customize-rootfs.txt
> +++ b/docs/manual/customize-rootfs.txt
> @@ -2,7 +2,9 @@
> ?Customizing the generated target filesystem
> ?~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> -There are a few ways to customize the resulting target filesystem:
> +Apart changing one or another configuration through +make
> +*-menuconfig+, there are a few ways to customize the resulting target
> +filesystem:

s/Apart/Apart from/
or
s/Apart/Besides/

I also don't think you can 'change one or another configuration'. You
could 'change configuration' or 'change one or more configuration
options'.

>
> ?* Customize the target filesystem directly and rebuild the image. ?The
> ? target filesystem is available under +output/target/+. ?You can
> --
> 1.7.10.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

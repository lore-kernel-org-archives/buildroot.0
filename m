From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Aug 2015 11:18:57 +0200
Subject: [Buildroot] [PATCH 1/1] zeromq: bump to version 4.1.2
In-Reply-To: <1438590279-25769-1-git-send-email-yba@tkos.co.il>
References: <1438590279-25769-1-git-send-email-yba@tkos.co.il>
Message-ID: <20150803111857.69ada16f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jonathan Ben-Avraham,

On Mon,  3 Aug 2015 11:24:39 +0300, Jonathan Ben-Avraham wrote:
> From: Jonathan Ben Avraham <yba@tkos.co.il>
> 
> 
> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
> ---
>  ....m4-make-kernel-specific-flags-cacheable.patch} |    0
>  ...isable-test_fork-if-fork-is-not-available.patch |   52 --------------------
>  ...-Fix-pkg-config-files-for-static-linking.patch} |    0
>  package/zeromq/0004-allow-without-libsodium.patch  |   38 --------------

Could you explain in the commit log why some of the patches are being
removed? Like if they are now upstream, point to the upstream commit?

> diff --git a/package/zeromq/zeromq.hash b/package/zeromq/zeromq.hash
> index 729e7ea..0d33431 100644
> --- a/package/zeromq/zeromq.hash
> +++ b/package/zeromq/zeromq.hash
> @@ -1,2 +1,4 @@
>  # Locally calculated from download (no sig, hash)
> -sha256	3bc93c5f67370341428364ce007d448f4bb58a0eaabd0a60697d8086bc43342b	zeromq-4.0.5.tar.gz
> +sha256	f9162ead6d68521e5154d871bac304f88857308bb02366b81bb588497a345927	zeromq-4.1.2.tar.gz
> +# From http://download.zeromq.org/SHA1SUMS:
> +#sha1	86c17096f7f4bf46cbcd2ad242cf8fec8a7cfb7b	zeromq-4.1.2.tar.gz

Why are you adding the SHA1, but commented out?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Aug 2012 11:14:39 +0200
Subject: [Buildroot] [PATCH 1/2] package/libnspr: add pkg-config file
In-Reply-To: <1345294543-13671-1-git-send-email-yann.morin.1998@free.fr>
References: <1345294543-13671-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20120821111439.1a46d367@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 18 Aug 2012 14:55:42 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> Some packages use pkg-config to check for libnspr.
> libnspr does bundle a .pc file, but it is not installed.

Here you're saying that libnspr bundles a .pc file... but

> diff --git a/package/libnspr/nspr.pc.in b/package/libnspr/nspr.pc.in
> new file mode 100644
> index 0000000..3719260
> --- /dev/null
> +++ b/package/libnspr/nspr.pc.in

here you're adding it to Buildroot. I'm confused. Could you explain? :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

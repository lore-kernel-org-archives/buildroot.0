From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Nov 2013 20:17:25 +0100
Subject: [Buildroot] [git commit] beecrypt: unconditionally disable
 openpm
In-Reply-To: <20131122232146.B26FF9BCCC@busybox.osuosl.org>
References: <20131122232146.B26FF9BCCC@busybox.osuosl.org>
Message-ID: <20131128201725.01d16cf9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Nov 2013 00:20:40 +0100, Peter Korsgaard wrote:

>  BEECRYPT_CONF_OPT = \
>  		--without-java \
> -		--without-python
> +		--without-python \
> +		--disable-openmp

Following this change, I've marked
http://patchwork.ozlabs.org/patch/191186/ as rejected.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

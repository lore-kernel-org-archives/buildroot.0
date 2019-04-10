From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 11:54:09 +0200
Subject: [Buildroot] [PATCH] boot/opensbi: add hash file
In-Reply-To: <20190409193826.8647-1-merker@debian.org>
References: <20190409193826.8647-1-merker@debian.org>
Message-ID: <20190410115409.06f6b847@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Karsten,

On Tue,  9 Apr 2019 21:38:26 +0200
Karsten Merker <merker@debian.org> wrote:

> diff --git a/boot/opensbi/opensbi.hash b/boot/opensbi/opensbi.hash
> new file mode 100644
> index 0000000000..4c6827ac3b
> --- /dev/null
> +++ b/boot/opensbi/opensbi.hash
> @@ -0,0 +1,3 @@
> +# sha256 and sha512 locally computed
> +sha256 07f18b73abf3b85aabe5bead19a923716c100d30eb58033459f39c3a224be300 opensbi-v0.3.tar.gz
> +sha512 44608a504110ea1a992ebfc05e66fb895295b18defe53f9939bc33c45b04653fc8812c865e19e6a33d48ed8040c6ec2436883815ca615fff85b5ca656a3a0ca4 opensbi-v0.3.tar.gz

We generally don't have both sha256 and sha512 hashes and typically use
sha256 for locally computed hashes. So I've dropped the sha512 hash and
applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

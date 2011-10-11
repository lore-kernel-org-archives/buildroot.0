From: Michael S. Zick <minimod@morethan.org>
Date: Tue, 11 Oct 2011 06:35:43 -0500
Subject: [Buildroot] [git commit] neon: cleanup
In-Reply-To: <20111011075632.11D3A8E2F8@busybox.osuosl.org>
References: <20111011075632.11D3A8E2F8@busybox.osuosl.org>
Message-ID: <201110110635.45321.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue October 11 2011, Peter Korsgaard wrote:
> #############################################################
> -NEON_VERSION:=0.29.6
> -NEON_SITE:=http://www.webdav.org/neon/
> -NEON_INSTALL_STAGING:=YES
> -NEON_CONF_OPT:=--without-gssapi --disable-rpath
> +NEON_VERSION= 0.29.6
>

Shouldn't there be one more space in the above to be consistent?

Mike
> +NEON_SITE = http://www.webdav.org/neon/
> +NEON_INSTALL_STAGING = YES
> +NEON_CONF_OPT = --without-gssapi --disable-rpath
> 

From: Will Newton <will.newton@gmail.com>
Date: Tue, 7 Dec 2010 11:21:49 +0000
Subject: [Buildroot] [PATCH] package/openssh: Use HTTP instead of FTP
	for source download.
In-Reply-To: <AANLkTinqN8rwckydZy7ys2gKsegziwuQJuQChjpU2gAe@mail.gmail.com>
References: <AANLkTinqN8rwckydZy7ys2gKsegziwuQJuQChjpU2gAe@mail.gmail.com>
Message-ID: <AANLkTikYBXOvM9zkQM7V1X=BF-p+HJpjGtApuyEj8-gp@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 1, 2010 at 2:44 PM, Will Newton <will.newton@gmail.com> wrote:
> HTTP should be more firewall friendly.
>
> Signed-off-by: Will Newton <will.newton@imgtec.com>

Is this ok for 2011.02?

> ---
> ?package/openssh/openssh.mk | ? ?2 +-
> ?1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 236a3a8..82c64d6 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -5,7 +5,7 @@
> ?#############################################################
>
> ?OPENSSH_VERSION = 5.6p1
> -OPENSSH_SITE = ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
> +OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
> ?OPENSSH_CONF_ENV = LD="$(TARGET_CC)"
> ?OPENSSH_CONF_OPT = --libexecdir=/usr/lib --disable-lastlog --disable-utmp \
> ? ? ? ? ? ? ? ?--disable-utmpx --disable-wtmp --disable-wtmpx --disable-strip
> --
> 1.7.2.2
>

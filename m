From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 21:30:18 +0200
Subject: [Buildroot] [PATCH] chrony: bump to version 2.4
In-Reply-To: <1465305031-30875-1-git-send-email-peter@korsgaard.com>
References: <1465305031-30875-1-git-send-email-peter@korsgaard.com>
Message-ID: <20160607213018.37570ffb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  7 Jun 2016 15:10:31 +0200, Peter Korsgaard wrote:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/chrony/chrony.hash | 7 ++++---
>  package/chrony/chrony.mk   | 2 +-
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
> index f39d316..e2f6f81 100644
> --- a/package/chrony/chrony.hash
> +++ b/package/chrony/chrony.hash
> @@ -1,3 +1,4 @@
> -# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2016/02/msg00001.html
> -md5  db6d46afea66f75dcc362f44623c1af4         chrony-2.3.tar.gz
> -sha1 c5e2aac4e4ad904bf73663ed63964bec91482a8a chrony-2.3.tar.gz
> +# From http://thread.gmane.org/gmane.comp.time.chrony.announce/36
> +md5  d0598aa8a9be8faccef9386f6fc0d5f2  chrony-2.4.tar.gz
> +sha1 8c243c545f242f869c9965e675828878970da5db  chrony-2.4.tar.gz
> +

Mistakenly added empty line here. I've dropped it and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

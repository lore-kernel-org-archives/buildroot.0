From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 3 May 2016 18:33:29 +0200
Subject: [Buildroot] [PATCH 1/5] package/nginx: bump version to 1.10.0
In-Reply-To: <1462132345-28253-1-git-send-email-martin@barkynet.com>
References: <1462132345-28253-1-git-send-email-martin@barkynet.com>
Message-ID: <20160503163329.GR26720@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Martin,
Martin Bark wrote,

> The ngx_http_spdy_module has been superseded by the ngx_http_v2_module
> so BR2_PACKAGE_NGINX_HTTP_SPDY_MODULE has changed to
> BR2_PACKAGE_NGINX_HTTP_V2_MODULE
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>

Could you check on sparc? I think nginx depends nowadays on some
atomics which aren't available for sparc32.
Could you take care of it? There are autobuild failures...

best regards
 Waldemar

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 May 2015 22:32:51 +0200
Subject: [Buildroot] [PATCH 1/6] php: delete /usr/lib/php/build instead
 of /usr/lib/php
In-Reply-To: <1431978724-25081-1-git-send-email-bos@je-eigen-domein.nl>
References: <1431978724-25081-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20150518223251.3dc8ab72@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Mon, 18 May 2015 21:51:59 +0200, Floris Bos wrote:
> External PHP modules like the OPcache may live in
> /usr/lib/php/extensions, so only delete /usr/lib/php/build
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  package/php/php.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This patch fixes bug #8121,
https://bugs.busybox.net/show_bug.cgi?id=8121.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

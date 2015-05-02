From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 19:18:42 +0200
Subject: [Buildroot] [PATCH v2] php.ini: set date.timezone
In-Reply-To: <1430579415-22802-3-git-send-email-bos@je-eigen-domein.nl>
References: <1430579415-22802-1-git-send-email-bos@je-eigen-domein.nl>
 <1430579415-22802-3-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20150502191842.0eec6479@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Sat,  2 May 2015 17:10:15 +0200, Floris Bos wrote:

> +ifeq ($(BR2_TARGET_LOCALTIME),)
> +PHP_LOCALTIME = UTC
> +else
> +PHP_LOCALTIME = $(BR2_TARGET_LOCALTIME)

I suppose you tested that a qstrip call is not needed here.

So, I applied with Arnout Reviewed-by.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

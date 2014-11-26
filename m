From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 22:52:45 +0100
Subject: [Buildroot] [PATCH next 3/3] package/tvheadend: Bump version
In-Reply-To: <1416772613-13447-3-git-send-email-bernd.kuhls@t-online.de>
References: <1416772613-13447-1-git-send-email-bernd.kuhls@t-online.de>
 <1416772613-13447-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141126225245.51ba2473@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 23 Nov 2014 20:56:53 +0100, Bernd Kuhls wrote:

> -TVHEADEND_VERSION = c053acd84e5cc48a3e70047f228728bf039cfacd
> +TVHEADEND_VERSION = d6bfd1ffe62e145a6a6e18d00ee722204ee898d4
>  TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
>  TVHEADEND_LICENSE = GPLv3+
>  TVHEADEND_LICENSE_FILES = LICENSE.md

This patch does not apply properly on the next branch, since tvheadend
was bumped in the mean time. Can you check if it should still be bumped
to d6bfd1 ?

I've marked this patch as Changes Requested in patchwork, so please
resend if you something to be applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

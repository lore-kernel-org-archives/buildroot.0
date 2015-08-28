From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 21:18:56 +0200
Subject: [Buildroot] [PATCH/next 02/10] package/libyuv: new package
In-Reply-To: <1439317015-8031-3-git-send-email-bernd.kuhls@t-online.de>
References: <1439317015-8031-1-git-send-email-bernd.kuhls@t-online.de>
 <1439317015-8031-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150828211856.3c8c27a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 11 Aug 2015 20:16:47 +0200, Bernd Kuhls wrote:

> +LIBYUV_VERSION = 1ebf86795cb213a37f06eb1ef3713cff080568ea
> +# we use the FreeSwitch fork because there is currently no alternative
> +# for https://chromium.googlesource.com/libyuv/libyuv which will be
> +# deactivated in 2015.
> +LIBYUV_SITE = https://freeswitch.org/stash/scm/sd/libyuv.git

Ok. I hope there will be a new official upstream location at some
point. There are already some github mirrors available, but they are
not more official than the freeswitch repo.

> +LIBYUV_SITE_METHOD = git
> +LIBYUV_LICENSE = BSD-4c

The license is actually BSD-3c. I've fixed that up and committed your
package to the next branch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

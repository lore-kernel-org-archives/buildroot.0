From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 16:44:53 +0200
Subject: [Buildroot] [PATCH] linux-headers: Account for
 LINUX_OVERRIDE_SRCDIR
In-Reply-To: <20170111195611.837-1-andrew.smirnov@gmail.com>
References: <20170111195611.837-1-andrew.smirnov@gmail.com>
Message-ID: <20170401164453.6c4d91d5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Jan 2017 11:56:11 -0800, Andrey Smirnov wrote:
> Use the value of LINUX_OVERRIDE_SRCDIR as override directory when
> BR2_KERNEL_HEADERS_AS_KERNEL is specified.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  package/linux-headers/linux-headers.mk | 1 +
>  1 file changed, 1 insertion(+)

As per the discussion with Arnout, I've marked this patch as "Rejected"
in patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

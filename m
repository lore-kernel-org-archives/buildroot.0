From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 20:41:50 +0100
Subject: [Buildroot] [PATCH v2 23/25] avahi: systemd cleanups
In-Reply-To: <1426878856-15747-24-git-send-email-mike@mikebwilliams.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
 <1426878856-15747-24-git-send-email-mike@mikebwilliams.com>
Message-ID: <20150320204150.4169961f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mike Williams,

On Fri, 20 Mar 2015 15:14:14 -0400, Mike Williams wrote:

> +ifneq ($(BR2_PACKAGE_SYSTEMD),y)
> +AVAHI_CFLAGS += -DDISABLE_SYSTEMD
> +endif

Seriously, do you test the patches you send? I really value the
contributions you're making around systemd support: it's great to have
someone finally picking up this topic and doing some
cleanup/refactoring. But please, test your patches at least minimally.

The <pkg>_CFLAGS variable does not exist and has no effect.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

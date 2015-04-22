From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 22:19:25 +0200
Subject: [Buildroot] [PATCH 1/5] avahi: systemd cleanups
In-Reply-To: <1429638638-28695-2-git-send-email-mike@mikebwilliams.com>
References: <1429638638-28695-1-git-send-email-mike@mikebwilliams.com>
 <1429638638-28695-2-git-send-email-mike@mikebwilliams.com>
Message-ID: <20150422221925.71751d6d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mike Williams,

On Tue, 21 Apr 2015 13:50:34 -0400, Mike Williams wrote:

> +ifneq ($(BR2_PACKAGE_SYSTEMD),y)

We normally use:

ifeq ($(BR2_PACKAGE_SYSTEMD),)

instead.

Other than that, applied.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

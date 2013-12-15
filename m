From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Dec 2013 17:12:17 +0100
Subject: [Buildroot] [ PATCH v4 17/20] busybox: add option to enable
 SELinux support
In-Reply-To: <1386872840-22051-18-git-send-email-clshotwe@rockwellcollins.com>
References: <1386872840-22051-1-git-send-email-clshotwe@rockwellcollins.com>
 <1386872840-22051-18-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <20131215171217.10575b07@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Thu, 12 Dec 2013 12:27:17 -0600, Clayton Shotwell wrote:

> +config BR2_PACKAGE_BUSYBOX_SELINUX
> +	bool "Enable SELinux support"

Maybe we don't need a Busybox sub-option and instead we can enable
SELinux support as soon as libselinux and libsepol are available?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

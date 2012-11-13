From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Nov 2012 09:46:51 +0100
Subject: [Buildroot] [PATCH] kexec: disable on avr32
In-Reply-To: <1352793705-30377-1-git-send-email-spdawson@gmail.com>
References: <1352793705-30377-1-git-send-email-spdawson@gmail.com>
Message-ID: <20121113094651.3035f9fa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tue, 13 Nov 2012 08:01:45 +0000, spdawson at gmail.com wrote:

> +comment "kexec is not supported on avr32"
> +	depends on BR2_avr32
> +

Until now, we generally didn't put a comment when a package wasn't
available for a particular architecture.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Jun 2016 13:51:37 +0200
Subject: [Buildroot] [PATCH v6] openblas: new package
In-Reply-To: <1466441142-52096-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1466441142-52096-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160621135137.45246fb7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Jun 2016 17:45:42 +0100, Vicente Olivert Riera wrote:

> +	default "ARMV7"        if BR2_cortex_a5 || BR2_cortex_a7 || \
> +	                          BR2_cortex_a8 || BR2_cortex_a9 || \
> +				  BR2_cortex_a12 || BR2_cortex_a17

You can use BR2_ARM_CPU_ARMV7A instead here.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

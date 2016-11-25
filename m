From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 23:01:20 +0100
Subject: [Buildroot] [PATCH v2 2/2] toolchain: kill ADI Blackfin
 toolchain
In-Reply-To: <20161123234035.6393-2-arnout@mind.be>
References: <20161123234035.6393-1-arnout@mind.be>
 <20161123234035.6393-2-arnout@mind.be>
Message-ID: <20161125230120.4a844c53@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Nov 2016 00:40:35 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:

> +config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
> +	bool "Blackfin.uclinux.org 2014R1"

This prompt was a bit short, so I changed it to:

	bool "Blackfin.uclinux.org 2014R1 toolchain removed"

Applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

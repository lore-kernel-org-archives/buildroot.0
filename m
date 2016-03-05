From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 21:27:07 +0100
Subject: [Buildroot] [PATCH 2/2] package/czmq: make zmakecert and
 zgossip optional
In-Reply-To: <1457208144-6613-2-git-send-email-joerg.krause@embedded.rocks>
References: <1457208144-6613-1-git-send-email-joerg.krause@embedded.rocks>
 <1457208144-6613-2-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160305212707.305f31a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sat,  5 Mar 2016 21:02:24 +0100, J?rg Krause wrote:

> +config BR2_PACKAGE_CZMQ_ZMAKECERT
> +	bool "zmakecert"
> +	help
> +	  Certificate generator for ZeroMQ CURVE security.
> +
> +config BR2_PACKAGE_CZMQ_ZGOSSIP
> +	bool "zgossip"
> +	help
> +	  Implements a gossip protocol for decentralized configuration
> +	  management.

How big are those binaries? Is it worth adding config options for those?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Jul 2017 16:46:10 +0200
Subject: [Buildroot] [PATCH v6 1/4] infra: add support for MIPS NaN
In-Reply-To: <20170628151713.10746-1-Vincent.Riera@imgtec.com>
References: <20170628151713.10746-1-Vincent.Riera@imgtec.com>
Message-ID: <20170716164610.4d030529@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Jun 2017 16:17:10 +0100, Vicente Olivert Riera wrote:

> +choice
> +	prompt "Target NaN"
> +	depends on BR2_mips_32r5 || BR2_mips_64r5
> +	default BR2_MIPS_ENABLE_NAN_2008
> +
> +	help
> +	  NaN encoding to be used

In fact, it would be good here to have a much more detailed help text,
perhaps by re-using bits of your commit log.

Same for the FP32 patch.

Could you send follow-up patches improving those help texts?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

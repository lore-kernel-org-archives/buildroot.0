From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 7 Nov 2016 22:26:32 +0100
Subject: [Buildroot] [PATCH v4 02/22] toolchain-external: reorder the
 contents of toolchain-external.mk
In-Reply-To: <20161107012017.22505-3-arnout@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
 <20161107012017.22505-3-arnout@mind.be>
Message-ID: <52005830-4f91-bac6-72ce-e8183448b5bc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 07/11/2016 ? 02:19, Arnout Vandecappelle (Essensium/Mind) a ?crit :
> When the toolchain-external logic will be split into separate packages,
> the order in which things are defined in toolchain-external.mk no
> makes less sense. So reorder things in a more logical fashion.
> 
> Also add a few more comments to the different sections.
> 
> No functional changes at all. The output of 'make -qp' hasn't changed,
> except for the order of arguments in
> TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> [Arnout: split off into separate patch, slightly change some comments,
>  reordered some parts]
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I reviewed as carefully as possible, It should be fine.

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

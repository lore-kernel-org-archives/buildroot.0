From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 6 Feb 2019 17:16:24 +0100
Subject: [Buildroot] [PATCH v3 1/5] skeleton-custom: use a script to
 check merged usr structure
In-Reply-To: <20180507144431.14488-2-casantos@datacom.ind.br>
References: <20180507144431.14488-1-casantos@datacom.ind.br>
 <20180507144431.14488-2-casantos@datacom.ind.br>
Message-ID: <3753c7fe-2b3c-b5d2-6d8e-dd95ea8b936c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/05/2018 16:44, Carlos Santos wrote:

> +SKELETON_CUSTOM_NOT_MERGED_USR_DIRS = $(shell support/scripts/check-merged-usr.sh $(SKELETON_CUSTOM_PATH))

 This line was too long.


> +# Output: the list non-compliant paths (empty if compliant).
                     ^of

 Regards,
 Arnout

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Jun 2021 22:20:57 +0200
Subject: [Buildroot] [PATCH 1/4 v5] support/misc/gitlab-ci.yml.in:
 templatise the make command
In-Reply-To: <b507b09b429bd11c2cb524055e53e9cb9c128942.1624911306.git.yann.morin.1998@free.fr>
References: <cover.1624911306.git.yann.morin.1998@free.fr>
 <b507b09b429bd11c2cb524055e53e9cb9c128942.1624911306.git.yann.morin.1998@free.fr>
Message-ID: <20210628222057.4892ea38@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 28 Jun 2021 22:15:12 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> From: Romain Naour <romain.naour@gmail.com>
> 
> In a followup commit, the make command used to log and display the last
> lines on error will be used in another job.
> Factorize it by introducing .run_make template.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>


-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

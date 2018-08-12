From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 14:39:51 +0200
Subject: [Buildroot] [PATCH v2] Makefile: introduce check-package target
In-Reply-To: <20180811104423.31391-1-thomas.petazzoni@bootlin.com>
References: <20180811104423.31391-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180812143951.757eca68@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Aug 2018 12:44:23 +0200, Thomas Petazzoni wrote:
> The snippet of code that runs a check-package on all
> .mk/.hash/Config.in files is currently only available within
> .gitlab-ci.yml, and isn't immediately and easily usable by Buildroot
> users. In order to simplify this, this commit introduces a top-level
> "check-package" make target that implements the same logic. The
> .gitlab-ci.yml file is changed to use "make check-package".
> 
> Since this target is oriented towards Buildroot developers, we
> intentionally do not clutter the already noisy "make help" text with
> this additional make target.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> I often found myself copy/pasting this find command line from
> .gitlab-ci.yml to my shell, and got tired of doing this, hence this
> patch.

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

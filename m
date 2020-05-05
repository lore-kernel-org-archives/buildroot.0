From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 May 2020 23:05:28 +0200
Subject: [Buildroot] [PATCH] package/solarus: bump to version 1.6.4
In-Reply-To: <20200504143742.3191019-1-romain.naour@gmail.com>
References: <20200504143742.3191019-1-romain.naour@gmail.com>
Message-ID: <20200505230528.320a6358@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 May 2020 16:37:42 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Add glm dependency since the bundled version is gone [1].
> 
> Update indentation of hash file (two spaces).
> 
> [1] https://gitlab.com/solarus-games/solarus/commit/5285c8e1afa538bbcd4c8654f9bbfb270cc7f52
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/solarus/Config.in    | 1 +
>  package/solarus/solarus.hash | 4 ++--
>  package/solarus/solarus.mk   | 6 +++---
>  3 files changed, 6 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

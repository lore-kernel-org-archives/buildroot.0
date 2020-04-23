From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Apr 2020 23:42:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/evtest: switch to Gitlab
In-Reply-To: <20200422093633.31668-1-sebastien.szymanski@armadeus.com>
References: <20200422093633.31668-1-sebastien.szymanski@armadeus.com>
Message-ID: <20200423234227.52fd55eb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Apr 2020 11:36:33 +0200
S?bastien Szymanski <sebastien.szymanski@armadeus.com> wrote:

> Downloading from the cgit repo is now broken and it is a mirror of the
> Gitlab repo so use the Gitlab repo.
> 
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
>  package/evtest/Config.in   | 2 +-
>  package/evtest/evtest.hash | 2 +-
>  package/evtest/evtest.mk   | 3 ++-
>  3 files changed, 4 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

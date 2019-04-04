From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Apr 2019 22:18:06 +0200
Subject: [Buildroot] [PATCH] package/gettext-tiny: bump version to add
 --template option
In-Reply-To: <20190404143132.7416-1-giulio.benetti@micronovasrl.com>
References: <20190404143132.7416-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190404221806.20fa9881@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  4 Apr 2019 16:31:32 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> Some package(i.e. rygel) uses gettext-tiny msgfmt with --template option
> to build, but current version(0.3.1) doesn't support --template flag and
> exits giving:
> "fopen: No such file or directory"
> On master branch they've added support for --template after lot of
> modifications, so it's hard to produce a patch to be applied against
> 0.3.1.
> 
> Then bump version to latest master branch commit.
> 
> Fixes:
> http://autobuild.buildroot.net/results/77b/77b1854c914915d3205d915a0f01001f6f3555df/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/gettext-tiny/gettext-tiny.hash | 2 +-
>  package/gettext-tiny/gettext-tiny.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

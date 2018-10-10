From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 15:26:37 +0200
Subject: [Buildroot] [PATCH v2 1/1] synergy: fix resolving of Buildroot
 git revision
In-Reply-To: <20180911195802.6847-1-pieterjan.camerlynck@gmail.com>
References: <20180911195802.6847-1-pieterjan.camerlynck@gmail.com>
Message-ID: <20181010152637.76adf8ab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Sep 2018 21:58:02 +0200, Pieterjan Camerlynck wrote:
> Starting version v1.10.0-stable, Synergy tries to resolve the git revision in
> the build directory. This causes CMake to either detect the Buildroot commit
> or fail when no git repo is found.
> 
> By manually setting SYNERGY_VERSION_STAGE to another value then snapshot, this
> behavior is skipped.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/5bab942322357bd71901cfc13ed3cff0c17edcce
> 
> Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
> ---
> Changes v1 -> v2:
>   - change author email address
> ---
>  package/synergy/synergy.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

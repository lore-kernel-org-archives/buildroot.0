From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 23:27:29 +0200
Subject: [Buildroot] [PATCH v2] package/gettext-tiny: bump version for
 having msgmerge working
In-Reply-To: <20190414095152.18557-1-giulio.benetti@micronovasrl.com>
References: <dc436ca2-f08b-2d6f-582f-3229bf2cfd3d@micronovasrl.com>
 <20190414095152.18557-1-giulio.benetti@micronovasrl.com>
Message-ID: <20191025232729.75e605bf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 14 Apr 2019 11:51:52 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> On current version msgmerge doesn't work properly. It exits giving:
> fopen: No such file or directory
> The problem has been signalled:
> https://github.com/sabotage-linux/gettext-tiny/issues/42
> and fixed with this commit:
> https://github.com/sabotage-linux/gettext-tiny/commit/a597aaebd15ef73a65d67f0d6f746ca7ca812d51
> 
> Bump version to latest commit.
> 
> Fixes:
> http://autobuild.buildroot.net/results/92a/92a43f5dfe4a6df7ab5de7defe078fac58c99d75/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
> Changes:
> V1->V2: improved commit log

Applied to master after tweaking the commit log, especially the fact
that it isn't a fix for the problem seen as we want to fix it
differently.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

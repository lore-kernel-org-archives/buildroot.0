From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 16:36:43 +0200
Subject: [Buildroot] [PATCH 24/27] package/tvheadend: re-enable package
 on microblaze
In-Reply-To: <20190614210346.121013-25-giulio.benetti@micronovasrl.com>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
 <20190614210346.121013-25-giulio.benetti@micronovasrl.com>
Message-ID: <20190620163643.6f0060ce@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Jun 2019 23:03:43 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> Package tvheadend has been disabled on microblaze with this commit:
> https://git.buildroot.net/buildroot/commit/?id=e1a59357e4dfe8fe9c9119d4b2bc9e4ec36eb3d0
> but commit log says that build failure is due to "some assertion
> failure in binutils", that is true. But those assertion failures in
> binutils are caused by package's Makefile itself that has been fixed by
> previous patch. So re-enable package for microblaze.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/tvheadend/Config.in | 2 --
>  1 file changed, 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

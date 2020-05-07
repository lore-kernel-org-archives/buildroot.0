From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 May 2020 22:48:43 +0200
Subject: [Buildroot] [PATCH v2] package/apparmor: skip docs building
In-Reply-To: <20200429211840.215032-1-angelo@amarulasolutions.com>
References: <20200429211840.215032-1-angelo@amarulasolutions.com>
Message-ID: <20200507224843.76a15b3b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 29 Apr 2020 23:18:40 +0200
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> When pod2man and pod2html are missing, building now exits with an
> error.
> Building of man pages and documentation should be skipped in buildroot,
> setting both executables to the "true" command it's sufficient to skip
> them.
> 
> Fixes:
> http://autobuild.buildroot.net/results/ca8d3071d888b5c1cfa3e275afaf05415e19627f
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
> Changelog:
> v1->v2:
>  * "echo" to "true" (Thomas P.)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

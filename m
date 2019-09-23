From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 22:34:26 +0200
Subject: [Buildroot] [PATCH] package/devmem2: remove reference from
 package/Config.in
In-Reply-To: <20190923202231.805-1-jcmvbkbc@gmail.com>
References: <20190923202231.805-1-jcmvbkbc@gmail.com>
Message-ID: <20190923223426.60518589@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Sep 2019 13:22:31 -0700
Max Filippov <jcmvbkbc@gmail.com> wrote:

> Change that removed package/devmem2 didn't remove reference to it from
> the package/Config.in. As a result make menuconfig fails with the
> following message now:
> 
>   package/Config.in:428: can't open file "package/devmem2/Config.in"
> 
> Remove reference to the package/devmem2 from package/Config.in.
> 
> Cc: Carlos Santos <unixmania@gmail.com>
> Fixes: 2b2579afebfc ("package/devmem2: remove package")
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Sorry about that, I fixed it in the mean time. The original devmem2
removal patch was no longer applying with git am, so I applied it
manually... and missed the removal of this important hunk.

Sorry about that :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

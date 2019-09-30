From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 10:07:21 +0200
Subject: [Buildroot] [PATCH] package/systemd: bump version to 243
In-Reply-To: <20190930054356.10489-1-jagan@amarulasolutions.com>
References: <20190930054356.10489-1-jagan@amarulasolutions.com>
Message-ID: <20190930100721.55633390@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Sep 2019 11:13:56 +0530
Jagan Teki <jagan@amarulasolutions.com> wrote:

> Bump systemd version to 243, this would remove patches that have been
> available in upstream and updated hash file.
> 
> Cc: Adam Duskett <aduskett@gmail.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

We already have a systemd bump to 243 proposed in patchwork, and it
looks much more complete than this one:

  http://patchwork.ozlabs.org/patch/1157207/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

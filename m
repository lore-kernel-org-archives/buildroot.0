From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 15:28:58 +0200
Subject: [Buildroot] [PATCH] package/apparmor: fix compilation with
 libintl
In-Reply-To: <20200424214020.381865-1-angelo@amarulasolutions.com>
References: <20200424214020.381865-1-angelo@amarulasolutions.com>
Message-ID: <20200425152858.58cabcdd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Apr 2020 23:40:20 +0200
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> When libintl is enabled, Apparmor should link againts libintl.
> The attached patch is already sent upstream.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

There's no autobuilder reference in your commit log, but I assume this
is fixing:

  http://autobuild.buildroot.net/results/8bf/8bf5ce74721f828b01fd708443d020cdf8dc7d3a/build-end.log

Correct ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

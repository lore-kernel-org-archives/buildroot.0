From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 14:47:20 +0100
Subject: [Buildroot] [PATCH] docs/website: fixing query.yahooapis.com
 shutdown
In-Reply-To: <1549287004-13747-1-git-send-email-angelo@amarulasolutions.com>
References: <1549287004-13747-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20190204144720.1ee85222@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 Feb 2019 14:30:04 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> This patch rework the use of query.yahooapis.com to do the conversion
> from xml to json required by our script and moves to the use of a js
> library. Datas are therefore now converted in json format on the client.
> 
> Unfortunately, cause of the CORS restriction on nabble and
> buildroot.org, we cannot retrieve directly the xml data from these
> servers and we need a CORS proxy to do that.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

This patch doesn't apply to master.. because it depends on:

  http://patchwork.ozlabs.org/patch/1035811/

which is not yet applied. When you have such dependencies, sending a
series is preferred, as it makes the dependency obvious.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

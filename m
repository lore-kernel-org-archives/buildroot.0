From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Aug 2018 11:08:10 +0200
Subject: [Buildroot] [PATCH v4 4/4] configs: add linux boot logo to a
 selection of configs
In-Reply-To: <1535118300-26815-4-git-send-email-angelo@amarulasolutions.com>
References: <1535118300-26815-1-git-send-email-angelo@amarulasolutions.com>
 <1535118300-26815-4-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20180827110810.1cdea92c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Aug 2018 15:45:00 +0200, Angelo Compagnucci wrote:
> From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> 
> This patch adds the buildroot logo as a boot log to a selection of
> defconfigs.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

I won't oppose to this very strongly, but I wanted to voice my opinion
that I am not sure it is very useful to adjust all those defconfigs to
make them use the "Buildroot Linux logo".

One aspect of Buildroot that I like a lot is that we don't try to do a
lot of "integration": we use upstream stuff as-is, and leave it up to
the Buildroot user to do all the polishing/integration. Having a
default logo with Buildroot branding goes a bit against this principle.

We'll have a random set of defconfigs using the logo, another random
set not using the logo. This really doesn't had much value overall.

So I'm very fine with PATCH 1/4 and 2/4 to help people customizing the
logo. Perhaps 3/4 to have an example logo (but not even sure it is
that useful), but I'm more skeptical about PATCH 4/4.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

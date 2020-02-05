From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 18:13:02 +0100
Subject: [Buildroot] [PATCH 2/2] pkg-stats: more upstream names
In-Reply-To: <20190828070251.22886-2-francois.perrad@gadz.org>
References: <20190828070251.22886-1-francois.perrad@gadz.org>
 <20190828070251.22886-2-francois.perrad@gadz.org>
Message-ID: <20200205181302.59a1099e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 28 Aug 2019 09:02:51 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> the python infrastructure populates the variables _NAME_UPSTREAM
> (like the luarocks one).
> and pkg-stats uses them.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/pkg-python.mk     | 1 +
>  support/scripts/pkg-stats | 7 ++++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)

So we discussed this with Arnout, and since release-monitoring.org
provides this mapping functionality, and someone has already filled in
the mapping details for almost all Buildroot packages. We don't want to
duplicate that information in Buildroot itself.

However, we can improve a bit the logic in pkg-stats when querying by
"guess". I'll reply to your PATCH 1/2 with more details about this idea.

In the mean time, I've marked this particular patch as Rejected.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

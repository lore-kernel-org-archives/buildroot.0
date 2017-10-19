From: Christian Stewart <christian@paral.in>
Date: Thu, 19 Oct 2017 12:10:31 -0400
Subject: [Buildroot] [PATCH 01/12] dumb-init: new package
In-Reply-To: <3b5d387e-8cd6-361e-f9d3-1dd36721bd94@mind.be>
References: <20171019002257.27646-1-christian@paral.in>
 <3b5d387e-8cd6-361e-f9d3-1dd36721bd94@mind.be>
Message-ID: <CA+h8R2pfvyc5+MaWqi76PmaiCHjQWU+wj4ODZ-JwuF-pRQ1c2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Thu, Oct 19, 2017 at 10:04 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>  This is already v3 of the series. Could you explain the changes w.r.t. to the
> previous versions? You should do that in the commit message...

Yes, typically I would follow the usual workflow but as this patch
series has for some reason taken many months to merge I neglected it
this time. This series is more of a, "oh hey, that's still pending, I
should go submit it" rather than another distinct revision. I'll be
sure to follow the guidelines in the future.

The changes here incorporated the minor requested changes from the last series:

 - standardize to the github notation for SITE
 - update to the latest version of tini

Overall very minor which is why I waited a bit to re-spin, there don't
seem to be many requested changes to this series and I've tested it
for a few months now.

Best,
Christian

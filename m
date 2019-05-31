From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 23:02:04 +0200
Subject: [Buildroot] [PATCH v2 3/6] support/gnuconfig: update to
 2019-05-28
In-Reply-To: <20190528203416.32261-4-thomas.petazzoni@bootlin.com>
References: <20190528203416.32261-1-thomas.petazzoni@bootlin.com>
 <20190528203416.32261-4-thomas.petazzoni@bootlin.com>
Message-ID: <20190531230204.12c3bcf8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 May 2019 22:34:13 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> This update includes support for the C-SKY architecture.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Note: this was suggested by Peter for next, instead of just patching
> the files to add csky support. It should be applied after
> cherry-picking 910b431d6383cd1ce4cd9eeb0a8466cb977c3789 from master.
> ---
>  support/gnuconfig/README.buildroot |    2 +-
>  support/gnuconfig/config.guess     |  836 +++++----
>  support/gnuconfig/config.sub       | 2525 ++++++++++++++--------------
>  3 files changed, 1774 insertions(+), 1589 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

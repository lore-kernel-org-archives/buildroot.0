From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 21:59:43 +0200
Subject: [Buildroot] [PATCH] package/bitcoin: fixup the 'v' prefix in
 the version
In-Reply-To: <20190905215052.20486-1-thomas.petazzoni@bootlin.com>
References: <20190905215052.20486-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190907215943.714b78bc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  5 Sep 2019 23:50:52 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> In order for the bitcoin version to match what is given by
> release-monitoring.org, the 'v' prefix should be encoded in
> BITCOIN_SITE and not BITCOIN_VERSION.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/bitcoin/bitcoin.hash | 2 +-
>  package/bitcoin/bitcoin.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

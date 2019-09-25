From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Sep 2019 22:55:51 +0200
Subject: [Buildroot] [PATCH buildroot-test] web/search.{js,
 php}: pass the event to the submit handler
In-Reply-To: <20190826121405.23134-1-victor.huesca@bootlin.com>
References: <20190826121405.23134-1-victor.huesca@bootlin.com>
Message-ID: <20190925225551.1ac6772f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 26 Aug 2019 14:14:05 +0200
Victor Huesca <victor.huesca@bootlin.com> wrote:

> Some web-browsers do not define the global event object on functions
> callback (see [1]). This cause an 'undefined event' error on the search
> page. Passing the event argument from the function caller fix this (at
> least it does on Firefox ESR 60.0.8).
> 
> [1] http://buildroot-busybox.2317881.n4.nabble.com/New-search-features-on-autobuild-buildroot-org-tt230624.html
> 
> Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
> ---
>  web/search.js  | 2 +-
>  web/search.php | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to buildroot-test, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

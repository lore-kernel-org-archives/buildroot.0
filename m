From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 23:28:02 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/gloox: disable tests and
 examples
In-Reply-To: <20200604082606.6080-1-heiko.thiery@gmail.com>
References: <20200604082606.6080-1-heiko.thiery@gmail.com>
Message-ID: <20200604232802.5a63ccde@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  4 Jun 2020 10:26:06 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/91385a34c80c5043519e96395e203eef662ac18d/
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
> The failure occures in building the tests. By disabling this the failure
> is gone. Nethertheless it could be checked if there can something
> reported upstrem.
> ---
>  package/gloox/gloox.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

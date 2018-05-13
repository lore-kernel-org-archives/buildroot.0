From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 23:20:52 +0200
Subject: [Buildroot] [PATCH] core/pkg-infra: add missing  step hooks
In-Reply-To: <20180428205304.3122-1-yann.morin.1998@free.fr>
References: <20180428205304.3122-1-yann.morin.1998@free.fr>
Message-ID: <20180513232052.7a8e269b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Apr 2018 22:53:04 +0200, Yann E. MORIN wrote:
> Also call the step hooks from the three steps they are currently not
> called in:
>   - download,
>   - actual download (when main archive is not the real source, like
>     external toolchains),
>   - rsync (for local or override-srcdir).
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/pkg-generic.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

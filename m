From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Feb 2019 22:58:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/stm32flash: bump to version 0.5
In-Reply-To: <2748BB04F99E7E45A3203C831E8B20FE34D35B97@SERBE4I2.intra.erbe-med.de>
References: <2748BB04F99E7E45A3203C831E8B20FE34D35B97@SERBE4I2.intra.erbe-med.de>
Message-ID: <20190218225858.05f8d246@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Markus,

Thanks for your contribution! I have applied your patch to our next
branch, but I have a few comments, see below.

On Mon, 18 Feb 2019 14:01:53 +0000
"Steinhilber, Markus" <Markus.Steinhilber@erbe-med.com> wrote:

> Bump to latest official version.
> 
> Signed-off-by: Markus Steinhilber <markus.steinhilber@erbe-med.com>

Your From: doesn't match your Signed-off-by: line. Your From is:

	LastName, FirstName <email>

While your SoB is:

	FirstName LastName <email>

We have some checks that verify that both are consistent, so I fixed up
the author name of your commit. Indeed, we have a preference for the:

	FirstName LastName <email>

formatting.

> diff --git a/package/stm32flash/stm32flash.hash b/package/stm32flash/stm32flash.hash
> new file mode 100644
> index 0000000000..dc97c10972
> --- /dev/null
> +++ b/package/stm32flash/stm32flash.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256 73afcbd317ca3eb080c14b6ed1451e5a74a3bbae8f8fb5fe24ea496333f03ead
> +stm32flash-1f934ae86babdeea47afdfae1d856d5fd5da6c53.tar.gz

This line was wrapped. I suspect you haven't sent this patch using "git
send-email", and due to this, it was line-wrapped by your e-mail
client. Using "git send-email" would avoid such issues.

A possible follow-up improvement to this package would be to add the
hash of the gpl-2.0.txt license file to the .hash file.

Thanks again for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 10:12:26 +0100
Subject: [Buildroot] [PATCH v4 2/3] test-pkg: Use the correct config
 prefix when merging
In-Reply-To: <20181114074605.13390-1-afshin.nasser@gmail.com>
References: <20181114074605.13390-1-afshin.nasser@gmail.com>
Message-ID: <20181124101226.33f22abb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Nov 2018 11:16:05 +0330, Nasser Afshin wrote:
> From: Nasser Afshin <Afshin.Nasser@gmail.com>
> 
> We should use an empty prefix as we do not have any prefix.
> Note that BR2_ is mere a convention.
> 
> Signed-off-by: Nasser Afshin <Afshin.Nasser@gmail.com>
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  utils/test-pkg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Aug 2018 12:38:58 +0200
Subject: [Buildroot] [PATCH] support/testing/infra: rm extra log flush
 in builder.py
In-Reply-To: <1533949346-7465-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1533949346-7465-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180811123858.7c1ef0c9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Aug 2018 20:02:26 -0500, Matt Weber wrote:
> While integrating proxy support in builder.py, a log flush
> was left in the code.  This commit cleans/removes that code.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  support/testing/infra/builder.py | 1 -
>  1 file changed, 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 23:03:44 +0200
Subject: [Buildroot] [PATCH 1/1] check-package: Flag usage of '\t \\$'.
In-Reply-To: <20180307094812.11293-1-nicolas.cavallari@green-communications.fr>
References: <20180307094812.11293-1-nicolas.cavallari@green-communications.fr>
Message-ID: <20180331230344.34ad43de@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Mar 2018 10:48:12 +0100, Nicolas Cavallari wrote:
> check-package would flag tabs before a backslash ('\t\\'),
> two spaces before a backslash ('  \\') but would not flag a tab before space
> before backslash ('\t \\'), allowing someone to bypass the check.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> 
> ---
> There is no occurence of this in buildroot.
>  utils/checkpackagelib/lib_mk.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

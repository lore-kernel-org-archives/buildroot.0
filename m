From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Feb 2018 08:57:23 +0100
Subject: [Buildroot] [PATCH 1/1] postgresql: security bump to 10.2
In-Reply-To: <20180209120231.10745-1-aduskett@gmail.com>
References: <20180209120231.10745-1-aduskett@gmail.com>
Message-ID: <20180210085723.52e970bc@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Feb 2018 07:02:31 -0500, Adam Duskett wrote:
> from https://www.postgresql.org/about/news/1829/
> 
> [1] CVE-2018-1052: Fix the processing of partition keys containing multiple
>                    expressions
> 
> [2] CVE-2018-1053: Ensure that all temporary files made with "pg_upgrade" are
>                    non-world-readable
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/postgresql/postgresql.hash | 4 ++--
>  package/postgresql/postgresql.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

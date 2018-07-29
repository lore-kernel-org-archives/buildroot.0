From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Jul 2018 15:19:50 +0200
Subject: [Buildroot] [PATCH v2 1/3] mariadb: move comments outside of
 define block
In-Reply-To: <20180726163703.7598-1-bluemrp9@gmail.com>
References: <20180726163703.7598-1-bluemrp9@gmail.com>
Message-ID: <20180729151950.45d9c48f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 Jul 2018 09:37:01 -0700, Ryan Coe wrote:
> There are two comments inside the post install define block that show up in
> the build. Fix this by moving the comments outside the block.
> 
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> ---
>  package/mariadb/mariadb.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

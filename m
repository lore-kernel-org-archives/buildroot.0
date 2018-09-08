From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 22:36:11 +0200
Subject: [Buildroot] [PATCH v2 1/1] libminiupnpc: fix hash for license.
In-Reply-To: <20180908195739.1610-1-asafka7@gmail.com>
References: <20180908195739.1610-1-asafka7@gmail.com>
Message-ID: <20180908223611.5b08b167@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  8 Sep 2018 22:57:39 +0300, Asaf Kahlon wrote:
> The LICENSE file change: replace '2015' with '2016'
> (commit cc9639d597f89c9f2478d36871f7741dd91e724a)
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> 
> ---
> v1->v2: explain the license change in the commit message
> ---
>  package/libminiupnpc/libminiupnpc.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

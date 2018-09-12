From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 21:10:24 +0200
Subject: [Buildroot] [PATCH 1/1] python-pytz: bump to version 2018.5
In-Reply-To: <20180911145823.15032-2-asafka7@gmail.com>
References: <20180911145823.15032-1-asafka7@gmail.com>
 <20180911145823.15032-2-asafka7@gmail.com>
Message-ID: <20180912211024.099688a1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Sep 2018 17:58:22 +0300, Asaf Kahlon wrote:
> Update license hash: change was a year bump.
> Remove zip extraction logic since now the package is provided as tar.gz.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-pytz/python-pytz.hash |  9 +++++----
>  package/python-pytz/python-pytz.mk   | 12 +++---------
>  2 files changed, 8 insertions(+), 13 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

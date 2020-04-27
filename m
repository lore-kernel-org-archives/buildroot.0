From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 21:43:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pycairo: depend on
 python3
In-Reply-To: <20200427173931.332855-1-asafka7@gmail.com>
References: <20200427173931.332855-1-asafka7@gmail.com>
Message-ID: <20200427214323.6791768c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Apr 2020 20:39:31 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> Since version 1.19.0 pycairo doesn't support Python 2 anymore.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/4d47c71f75a61810c5f58a720245bef38b3f3db0
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-pycairo/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

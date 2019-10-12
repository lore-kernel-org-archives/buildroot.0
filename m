From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Oct 2019 22:04:02 +0200
Subject: [Buildroot] [PATCH 1/2]
 package/python-backports-functools-lru-cache: new pacakge
In-Reply-To: <20191011083527.26140-1-asafka7@gmail.com>
References: <20191011083527.26140-1-asafka7@gmail.com>
Message-ID: <20191012220402.1f2e1d3c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 11 Oct 2019 11:35:22 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> Backport of functools.lru_cache from Python 3.3.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/Config.in                                 |  1 +
>  .../Config.in                                     |  7 +++++++
>  .../python-backports-functools-lru-cache.hash     |  5 +++++
>  .../python-backports-functools-lru-cache.mk       | 15 +++++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 package/python-backports-functools-lru-cache/Config.in
>  create mode 100644 package/python-backports-functools-lru-cache/python-backports-functools-lru-cache.hash
>  create mode 100644 package/python-backports-functools-lru-cache/python-backports-functools-lru-cache.mk

Both patches applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

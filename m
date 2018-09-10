From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 17:19:50 +0200
Subject: [Buildroot] [PATCH v2 1/1] python-gunicorn: bump to version
 19.9.0
In-Reply-To: <20180910143718.5845-1-asafka7@gmail.com>
References: <20180910143718.5845-1-asafka7@gmail.com>
Message-ID: <20180910171950.1d680be5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Sep 2018 17:37:18 +0300, Asaf Kahlon wrote:
> No need for setuptools on target anymore.
> Add license hash.
> 
> Fixes:
> http://autobuild.buildroot.net/results/3d5/3d526c23ae17f03cbd771f6ad18390567c1c5d3a/
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> 
> ---
> v1->v2: add autobuild issue being fixed by the commit.
> ---
>  package/python-gunicorn/Config.in            | 1 -
>  package/python-gunicorn/python-gunicorn.hash | 8 +++++---
>  package/python-gunicorn/python-gunicorn.mk   | 4 ++--
>  3 files changed, 7 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

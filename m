From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 13:57:55 +0200
Subject: [Buildroot] [PATCH v5 1/2] package/python-numpy: fixup numpy
 distutils for cross compilation
In-Reply-To: <20190930084326.4414-1-esben@geanix.com>
References: <20190930084326.4414-1-esben@geanix.com>
Message-ID: <20190930135755.30562b5a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Esben,

On Mon, 30 Sep 2019 10:43:25 +0200
Esben Haabendal <esben@geanix.com> wrote:

> Fix problems using the numpy distutils extension for cross compilation,
> so that linking with npymath library will use target library when building
> target packages.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>

When you submit new version of patches, could you include a changelog
of what has changed from the previous version ?

You have posted several iterations, with no indication of the changes
between the versions, which makes it difficult to keep track of why new
versions are being posted.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 15:39:04 +0200
Subject: [Buildroot] [PATCH 1/1] python-gunicorn: bump to version 19.9.0
In-Reply-To: <20180910062405.20103-1-asafka7@gmail.com>
References: <20180910062405.20103-1-asafka7@gmail.com>
Message-ID: <20180910153904.62294ffc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Sep 2018 09:24:05 +0300, Asaf Kahlon wrote:
> No need for setuptools on target anymore.
> Add license hash.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

This should also fix:

  http://autobuild.buildroot.net/results/3d5/3d526c23ae17f03cbd771f6ad18390567c1c5d3a/build-end.log

Because 19.9.0 contains a fix for Python 3.7.0 compatibility:

  The internal module gunicorn.workers.async was renamed to
  gunicorn.workers.base_async since async is now a reserved word in
  Python 3.7. (pull request 1527)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

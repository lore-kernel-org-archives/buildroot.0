From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Sep 2020 09:57:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-ipdb: new package
In-Reply-To: <20200528095204.540452-1-asafka7@gmail.com>
References: <20200528095204.540452-1-asafka7@gmail.com>
Message-ID: <20200908095718.4f9c9a25@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 28 May 2020 12:52:04 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> IPython-enabled pdb.
> 
> This package can be very helpful when someone wants to debug
> a Python application on the board itself.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/Config.in                    |  1 +
>  package/python-ipdb/Config.in        |  9 +++++++++
>  package/python-ipdb/python-ipdb.hash |  5 +++++
>  package/python-ipdb/python-ipdb.mk   | 14 ++++++++++++++
>  4 files changed, 29 insertions(+)
>  create mode 100644 package/python-ipdb/Config.in
>  create mode 100644 package/python-ipdb/python-ipdb.hash
>  create mode 100644 package/python-ipdb/python-ipdb.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

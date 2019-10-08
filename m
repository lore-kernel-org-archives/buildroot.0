From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 22:47:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-dpkt: bump to version
 1.9.2
In-Reply-To: <20191008130810.27342-7-asafka7@gmail.com>
References: <20191008130810.27342-1-asafka7@gmail.com>
 <20191008130810.27342-7-asafka7@gmail.com>
Message-ID: <20191008224713.22987705@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  8 Oct 2019 16:08:10 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> * Add hash for license file.
> * Take tarball from PyPi (instead of Github).
> * Update _SETUP_TYPE to setuptools.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-dpkt/python-dpkt.hash | 7 +++++--
>  package/python-dpkt/python-dpkt.mk   | 7 ++++---
>  2 files changed, 9 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

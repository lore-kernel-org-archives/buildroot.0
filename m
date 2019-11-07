From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Nov 2019 22:40:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-uvloop: bump to version
 0.14.0
In-Reply-To: <20191105194756.9213-2-asafka7@gmail.com>
References: <20191105194756.9213-1-asafka7@gmail.com>
 <20191105194756.9213-2-asafka7@gmail.com>
Message-ID: <20191107224033.2eabc92f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  5 Nov 2019 21:47:56 +0200
Asaf Kahlon <asafka7@gmail.com> wrote:

> The package now fully supports Python 3.8, so the pre-build
> hook and the dependency on host-python-cython can be removed.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-uvloop/python-uvloop.hash |  4 ++--
>  package/python-uvloop/python-uvloop.mk   | 17 +++++------------
>  2 files changed, 7 insertions(+), 14 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

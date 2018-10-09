From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 22:00:59 +0200
Subject: [Buildroot] [PATCH v3 1/3] package/python-numpy: add host
 variant for piglit
In-Reply-To: <20180922105626.22626-1-romain.naour@gmail.com>
References: <20180922105626.22626-1-romain.naour@gmail.com>
Message-ID: <20181009220059.7a1e163a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Sep 2018 12:56:24 +0200, Romain Naour wrote:
> host-python-numpy is required by piglit buildsystem for crosscompiling.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/python-numpy/python-numpy.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

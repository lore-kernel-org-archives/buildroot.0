From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jul 2020 09:47:38 +0200
Subject: [Buildroot] [PATCH 00/12] package/udisks: bump version to 2.9.0
In-Reply-To: <20200723010810.3237608-1-aduskett@gmail.com>
References: <20200723010810.3237608-1-aduskett@gmail.com>
Message-ID: <20200723094738.5ad33b9b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Jul 2020 18:07:58 -0700
aduskett at gmail.com wrote:

> The size difference between the old and new versions of udisks, even with the
> additional dependencies is:
> 
> Old: 56M
> New: 69M

Wow, that's still huge. Do you have a breakdown of that size
per-package, i.e a "make graph-size" output for both the old and new
situations ?

I guess the fact that polkit uses spidermonkey is contributing quite a
lot to overall size.

> I am sure there will be some additional changes requested, as this is a hefty
> patch series, but * hopefully, * it is broken down enough that Thomas won't
> complain too much! :)

Hehe :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 22:30:35 +0200
Subject: [Buildroot] [PATCH 1/1] python-setuptools: bump to 40.0.0
In-Reply-To: <20180820201142.20383-1-aduskett@gmail.com>
References: <20180820201142.20383-1-aduskett@gmail.com>
Message-ID: <20180820223035.2e74e325@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 13:11:42 -0700, Adam Duskett wrote:
> From: Adam Duskett <aduskett@greenlots.com>
> 
> With the introduction of Python 3.7.0, setuptools also needs to be updated.
> Without the update, several packages will fail to build or install with a
> ValueError: bad marshal data (unknown type code).
> 
> Updating setuptools to 40.0.0 version fixes this issue.
> 
> Even though 40.1.0 is out, updating to 40.0.0 is recommended as it seems like
> 40.1.0 breaks version detection on some python packages such as
> python-cryptography which will error out with a complaint that setuptools is too
> old, even though it's at 40.1.0. Using 40.0.0 fixes the issue.
> 
> Fixes:
> http://autobuild.buildroot.net/results/636/636da0febe02f991095965d52cc4a8b2da644777/
> http://autobuild.buildroot.net/results/5f6/5f659130a6a32a4c43d6ed2c3b559df77ae18249/
> Signed-off-by: Adam Duskett <aduskett@greenlots.com>
> ---
>  package/python-setuptools/python-setuptools.hash | 2 +-
>  package/python-setuptools/python-setuptools.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

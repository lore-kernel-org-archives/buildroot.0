From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Sep 2018 18:51:31 +0200
Subject: [Buildroot] [PATCH 1/1] python-setuptools: use pypi package
In-Reply-To: <20180921150150.32095-1-aduskett@gmail.com>
References: <20180921150150.32095-1-aduskett@gmail.com>
Message-ID: <20180922185131.26604242@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Sep 2018 11:01:50 -0400, Adam Duskett wrote:
> The releases on Github produces a setuptools version that isn't PEP518
> compliant because a .post number is attached to the .egg file
> (IE: 40.0.0.post20180820) which can cause a python package using setuptools
> to fail if looking for a setuptools version.
> 
> Instead, using the official release from pypi is recommended as it does not
> produce a  .post version on the egg file.
> 
> Another benefit is not having to run bootstrap.py either.
> 
> See https://github.com/pypa/setuptools/issues/1462 for more details about
> the issue
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  .../python-setuptools/python-setuptools.hash  |  5 +++--
>  .../python-setuptools/python-setuptools.mk    | 20 +++++++++++--------
>  2 files changed, 15 insertions(+), 10 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 23:35:17 +0200
Subject: [Buildroot] [PATCH] package/python-web2py: bump to version
 R-2.15.4
In-Reply-To: <1504508588-30424-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1504508588-30424-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20170906233517.5fadfd56@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Sep 2017 09:03:08 +0200, Angelo Compagnucci wrote:
> This patch bumps web2py to the latest version R-2.15.4 and bumps
> also the python-pydal dependency to the required latest version 17.8.
> Starting with version R-2.15.x web2py supports also python 3, so
> updating the package to support both versions.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  package/python-pydal/python-pydal.hash   |  4 ++--
>  package/python-pydal/python-pydal.mk     |  4 ++--
>  package/python-web2py/Config.in          | 10 ++++++----
>  package/python-web2py/python-web2py.hash |  2 +-
>  package/python-web2py/python-web2py.mk   |  7 ++++---
>  5 files changed, 15 insertions(+), 12 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

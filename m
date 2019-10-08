From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 22:39:14 +0200
Subject: [Buildroot] [PATCH 1/3] package/proj: needs C++11
In-Reply-To: <20191008170433.26574-1-fontaine.fabrice@gmail.com>
References: <20191008170433.26574-1-fontaine.fabrice@gmail.com>
Message-ID: <20191008223914.60d14d65@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  8 Oct 2019 19:04:31 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> proj needs C++11 since version 5.2.0 and
> https://github.com/OSGeo/PROJ/commit/29051766975d471c4eff9f7b3137752234cf1a4c
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/af3451a37b5f6c81d4b19edfe84dbed09e1af0e9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libgeotiff/Config.in | 7 +++++--
>  package/proj/Config.in       | 7 +++++--
>  2 files changed, 10 insertions(+), 4 deletions(-)

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

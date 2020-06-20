From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 22:57:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/cannelloni: bump to version
 1.0.0
In-Reply-To: <20200614212010.907738-1-fontaine.fabrice@gmail.com>
References: <20200614212010.907738-1-fontaine.fabrice@gmail.com>
Message-ID: <20200620225736.3153ba28@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 14 Jun 2020 23:20:10 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - Add -std=c++11 to fix the build with gcc 4.8 as it has been removed by
>   upstream since version 1.0.0 and
>   https://github.com/mguentner/cannelloni/commit/2558902f0b2c2750ce99d05ac3cfe149c391482b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Add-missing-cstdio-include.patch     | 29 -------------------
>  package/cannelloni/cannelloni.hash            |  2 +-
>  package/cannelloni/cannelloni.mk              |  5 ++--
>  3 files changed, 4 insertions(+), 32 deletions(-)
>  delete mode 100644 package/cannelloni/0001-Add-missing-cstdio-include.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

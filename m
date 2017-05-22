From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 May 2017 15:59:22 +0200
Subject: [Buildroot] [PATCH/next] package/apitrace: bump version
In-Reply-To: <20170521171101.14097-1-bernd.kuhls@t-online.de>
References: <20170521171101.14097-1-bernd.kuhls@t-online.de>
Message-ID: <20170522155922.1eeb98d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 May 2017 19:11:01 +0200, Bernd Kuhls wrote:
> Currently we have version 7.0, released July 2015. Latest upstream
> release 7.1, which dates back to November 2015, causes build errors.
> 
> Therefore we bump to git HEAD, updated May 2017, which builds fine.
> 
> The package requires gcc-4.9 or later now:
> https://github.com/apitrace/apitrace/commit/2940c642832ba9dd0322a351034a2c52331e6e2b
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/apitrace/Config.in     | 6 +++---
>  package/apitrace/apitrace.hash | 2 +-
>  package/apitrace/apitrace.mk   | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

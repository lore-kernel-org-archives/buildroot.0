From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 Sep 2020 14:42:01 +0200
Subject: [Buildroot] [PATCH v2,
 1/3] package/openpgm: bump to version 5-3-128
In-Reply-To: <20200902061753.3668480-1-fontaine.fabrice@gmail.com>
References: <20200902061753.3668480-1-fontaine.fabrice@gmail.com>
Message-ID: <20200906144201.3c3b8498@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  2 Sep 2020 08:17:51 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop first patch (not needed since
>   https://github.com/steve-o/openpgm/commit/e2ff9cf32df5a9037e956a6be1afe75391b1941d)
> - Drop second and third patch (already in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Update zeromq package

I have applied the entire series, but not in the order you proposed: I
have applied PATCH 2/3 and 3/3 first, and then PATCH 1/3. Indeed
otherwise the series is not bisectable.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

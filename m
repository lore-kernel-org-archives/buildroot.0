From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Oct 2020 14:27:13 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/transmission: bump version
 to 3.00
In-Reply-To: <20200522203612.419241-1-bernd.kuhls@t-online.de>
References: <20200522203612.419241-1-bernd.kuhls@t-online.de>
Message-ID: <20201017142713.43032cf2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 22 May 2020 22:36:12 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patched applied upstream, reformatted hashes.
> 
> Updated license hash due to copyright update to 2020:
> https://github.com/transmission/transmission/commit/2d940e5cafe01a6ea9285b7d39ccada6e90afab1
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...1.0.18-has-sys-quota.h-synced-with-G.patch |  29 ----
>  package/transmission/0005-libsystemd.patch    | 133 ------------------
>  package/transmission/transmission.hash        |   4 +-
>  package/transmission/transmission.mk          |   2 +-
>  4 files changed, 3 insertions(+), 165 deletions(-)
>  delete mode 100644 package/transmission/0004-uClibc-ng-since-1.0.18-has-sys-quota.h-synced-with-G.patch
>  delete mode 100644 package/transmission/0005-libsystemd.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

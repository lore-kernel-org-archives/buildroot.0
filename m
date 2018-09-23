From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 17:05:03 +0200
Subject: [Buildroot] [PATCH 1/1] dvblast: drop NPTL dependency
In-Reply-To: <20180922200045.6608-1-fontaine.fabrice@gmail.com>
References: <20180922200045.6608-1-fontaine.fabrice@gmail.com>
Message-ID: <20180923170503.608f6f2d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Sep 2018 22:00:45 +0200, Fabrice Fontaine wrote:
> The latest uClibc-ng version (1.0.30) provides clock_nanosleep() even
> for non NPTL configurations.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dvblast/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

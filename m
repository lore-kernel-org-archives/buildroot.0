From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 16:24:34 +0200
Subject: [Buildroot] [PATCH 1/1] can-utils: drop NPTL dependency
In-Reply-To: <20180923122058.9529-1-fontaine.fabrice@gmail.com>
References: <20180923122058.9529-1-fontaine.fabrice@gmail.com>
Message-ID: <20180923162434.7eb14348@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Sep 2018 14:20:58 +0200, Fabrice Fontaine wrote:
> The latest uClibc-ng version (1.0.30) provides clock_nanosleep() even
> for non NPTL configurations.
> 
> Don't keep a dependency on threads as can-utils doesn't need it
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/can-utils/Config.in | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

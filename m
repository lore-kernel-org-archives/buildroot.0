From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Sep 2018 18:45:43 +0200
Subject: [Buildroot] [PATCH v2,1/1] blktrace: drop NPTL dependency
In-Reply-To: <20180921215441.2764-1-fontaine.fabrice@gmail.com>
References: <20180921215441.2764-1-fontaine.fabrice@gmail.com>
Message-ID: <20180922184543.42896a68@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Sep 2018 23:54:41 +0200, Fabrice Fontaine wrote:
> The latest uClibc-ng version (1.0.30) provides clock_nanosleep() even
> for non NPTL configurations.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Keep a dependency on threads

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

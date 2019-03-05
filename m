From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Mar 2019 21:49:22 +0100
Subject: [Buildroot] [PATCH/next 1/6] package/flashrom: remove dmidecode
 dependency
In-Reply-To: <20190228192613.30160-1-fontaine.fabrice@gmail.com>
References: <20190228192613.30160-1-fontaine.fabrice@gmail.com>
Message-ID: <20190305214922.3ca3c662@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 28 Feb 2019 20:26:08 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> flashrom uses its own internal DMI decoder since version 0.9.8 and
> https://github.com/flashrom/flashrom/commit/4c6d3a4b732732eb20bfb0fc9d857abaa4c41c88
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/flashrom/Config.in | 2 --
>  1 file changed, 2 deletions(-)

Entire series applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

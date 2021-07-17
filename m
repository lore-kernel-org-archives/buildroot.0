From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Jul 2021 10:06:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: requires DES support in
 openssl
In-Reply-To: <20210701193943.138107-1-fontaine.fabrice@gmail.com>
References: <20210701193943.138107-1-fontaine.fabrice@gmail.com>
Message-ID: <20210717100612.0dc3f2bb@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu,  1 Jul 2021 21:39:43 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Enable DES in openssl to fix build failure raised since commit
> a83d41867c8d69a77d5cd0a665aa216af5340359
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c10800fde50b123809557ed50e0a86acb59404a4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/php/Config.ext | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

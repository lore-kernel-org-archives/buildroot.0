From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 22:07:59 +0200
Subject: [Buildroot] [PATCH 1/1] botan: disable documentation
In-Reply-To: <20181011200112.21385-1-fontaine.fabrice@gmail.com>
References: <20181011200112.21385-1-fontaine.fabrice@gmail.com>
Message-ID: <20181011220759.5cda3f65@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Oct 2018 22:01:12 +0200, Fabrice Fontaine wrote:
> Fix following error if sphinx is found but its version is too low:
> Sphinx version error:
> This project needs at least Sphinx v1.2 and therefore cannot be built with this version.
> Ignoring ImportError and using old theme
>   ERROR: Error running sphinx-build -q -c ./src/configs/sphinx -b html ./doc/manual build/docs/manual
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/c15715a05a41035954f32510483314060ea31260
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/botan/botan.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

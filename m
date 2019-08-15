From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Aug 2019 15:06:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/piglit: fix build of GLES tests
In-Reply-To: <20190814215843.9922-1-fontaine.fabrice@gmail.com>
References: <20190814215843.9922-1-fontaine.fabrice@gmail.com>
Message-ID: <20190815150656.2addb78d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 14 Aug 2019 23:58:43 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> GLES tests needs libegl so:
> - check for BR2_PACKAGE_HAS_LIBEGL to enable them
> - add libegl to PIGLIT_DEPENDENCIES if needed
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3c2b7fb1e54dd52a5fd9c1024b8258e02063bd2c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/piglit/piglit.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

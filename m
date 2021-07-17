From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Jul 2021 10:08:43 +0200
Subject: [Buildroot] [PATCH 1/2] package/libnice: add
 gobject-introspection optional dependency
In-Reply-To: <20210707204114.414040-1-fontaine.fabrice@gmail.com>
References: <20210707204114.414040-1-fontaine.fabrice@gmail.com>
Message-ID: <20210717100843.5341b6dd@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed,  7 Jul 2021 22:41:13 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> gobject-introspection is an optional dependency which is enabled by
> default since version 0.1.8 and
> https://github.com/libnice/libnice/commit/0388646bdba5f91bb6bb509f5a1c6e9e3f068555
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1cba7aa233e19472a69ffc2d8f7324d363a22deb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libnice/libnice.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Both applied to master!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

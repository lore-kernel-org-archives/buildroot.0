From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Dec 2019 15:29:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/iputils: fix static build with
 libidn2
In-Reply-To: <20191228104023.3606670-1-fontaine.fabrice@gmail.com>
References: <20191228104023.3606670-1-fontaine.fabrice@gmail.com>
Message-ID: <20191231152912.423758f3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Dec 2019 11:40:23 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/82d4738711a009959436fa419bd78c7a9540d33e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ....build-fix-static-build-with-libidn2.patch | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/iputils/0001-meson.build-fix-static-build-with-libidn2.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

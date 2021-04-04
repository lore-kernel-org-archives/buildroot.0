From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Apr 2021 14:08:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/pcmanfm: fix build with
 gettext-tiny
In-Reply-To: <20210329190633.26229-1-fontaine.fabrice@gmail.com>
References: <20210329190633.26229-1-fontaine.fabrice@gmail.com>
Message-ID: <20210404140814.27b55989@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 29 Mar 2021 21:06:33 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix build of pcmanfm in version 1.3.2 with gettext-tiny
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/69f4e5fa44208429b143011640971a61d709d5b1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...po-de-po-fix-build-with-gettext-tiny.patch | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/pcmanfm/0001-po-de-po-fix-build-with-gettext-tiny.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

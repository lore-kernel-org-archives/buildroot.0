From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 22:10:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/gerbera: fix static build with
 libmatroska
In-Reply-To: <20200620160437.1010552-1-fontaine.fabrice@gmail.com>
References: <20200620160437.1010552-1-fontaine.fabrice@gmail.com>
Message-ID: <20200620221041.78a130ca@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 20 Jun 2020 18:04:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/ee365f792feb0fe69ed765fda625afabc91ec769
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...make-FindMatroska-fix-static-linking.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/gerbera/0003-cmake-FindMatroska-fix-static-linking.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

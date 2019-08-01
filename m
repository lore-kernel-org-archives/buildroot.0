From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 09:22:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/can-utils: fix build with
 kernel >= 5.2
In-Reply-To: <20190714201920.15718-1-fontaine.fabrice@gmail.com>
References: <20190714201920.15718-1-fontaine.fabrice@gmail.com>
Message-ID: <20190801092222.5041abd5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 14 Jul 2019 22:19:20 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/363de7d9bf433be8bc47ba4ee52ae0bb80fa9021
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...o-find-SIOCGSTAMP-with-latest-kernel.patch | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 package/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 09:22:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/socketcand: fix build with
 kernel >= 5.2
In-Reply-To: <20190714230602.8861-1-fontaine.fabrice@gmail.com>
References: <20190714230602.8861-1-fontaine.fabrice@gmail.com>
Message-ID: <20190801092229.5eb8547a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Jul 2019 01:06:02 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/3112b1ad77e805cd3ca61bb79560e8e13a466589
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...o-find-SIOCGSTAMP-with-latest-kernel.patch | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 package/socketcand/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

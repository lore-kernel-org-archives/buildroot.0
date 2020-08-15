From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Aug 2020 16:15:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/drbd-utils: fix build with gcc
 10
In-Reply-To: <20200815082034.2056096-1-fontaine.fabrice@gmail.com>
References: <20200815082034.2056096-1-fontaine.fabrice@gmail.com>
Message-ID: <20200815161508.4a2301a9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 15 Aug 2020 10:20:34 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/e444f46cd6e6d767592b17b83095737d0508a475
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-setup_options-definitions-as-extern.patch | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/drbd-utils/0001-v84-Make-setup_options-definitions-as-extern.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

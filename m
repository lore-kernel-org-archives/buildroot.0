From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Oct 2018 14:36:03 +0200
Subject: [Buildroot] [PATCH 1/1] screen: fix parallel build
In-Reply-To: <20181003210624.3085-1-fontaine.fabrice@gmail.com>
References: <20181003210624.3085-1-fontaine.fabrice@gmail.com>
Message-ID: <20181004143603.22844c1d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  3 Oct 2018 23:06:24 +0200, Fabrice Fontaine wrote:
> comm.h is needed to build list_display.o and list_generic.o otherwise
> parallel builds will sometimes fail
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/43105f14857dbe72d8878fc7b3db67f7bdca93cc
>  - http://autobuild.buildroot.org/results/47f4ecbec1355285633df287fc9c4e7cccde9378
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-needed-for-list_-display-generic-.o.patch | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/screen/0011-comm.h-needed-for-list_-display-generic-.o.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Aug 2020 13:21:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/ncftp: fix build with gcc 10
In-Reply-To: <20200821191842.3237320-1-fontaine.fabrice@gmail.com>
References: <20200821191842.3237320-1-fontaine.fabrice@gmail.com>
Message-ID: <20200823132106.5f6ad58d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 21 Aug 2020 21:18:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/78822bc0e0039e8f8949011a256cac022863276f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ncftp/0001-fix-gcc-10.patch | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 package/ncftp/0001-fix-gcc-10.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

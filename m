From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 12:37:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: fix build with musl
In-Reply-To: <20190528191704.25405-1-fontaine.fabrice@gmail.com>
References: <20190528191704.25405-1-fontaine.fabrice@gmail.com>
Message-ID: <20190601123702.39c6ab74@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 May 2019 21:17:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/c703d45ab691641beabc3440f081a8bc195b4a23
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../wpewebkit/0001-Fix-build-with-musl.patch  | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 package/wpewebkit/0001-Fix-build-with-musl.patch

Applied to master, thanks. Was this submitted upstream ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

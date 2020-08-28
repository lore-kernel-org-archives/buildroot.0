From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 00:11:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/chocolate-doom: fix build with
 gcc 10
In-Reply-To: <20200828220720.431870-1-fontaine.fabrice@gmail.com>
References: <20200828220720.431870-1-fontaine.fabrice@gmail.com>
Message-ID: <20200829001148.54b8f3d0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 29 Aug 2020 00:07:20 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/02828f2d9956d1e3727774b5045790aa3611428d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...move-redundant-demoextend-definition.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

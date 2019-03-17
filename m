From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 12:16:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/xapp_xfd: add optional
 xlib_libxkbfile dependency
In-Reply-To: <20190316182524.15529-1-fontaine.fabrice@gmail.com>
References: <20190316182524.15529-1-fontaine.fabrice@gmail.com>
Message-ID: <20190317121610.60604de1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 16 Mar 2019 19:25:24 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/6a487750c0f08f1a87ae4e30e139e5a1a6004b81
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/x11r7/xapp_xfd/xapp_xfd.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

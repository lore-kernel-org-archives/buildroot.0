From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jul 2019 22:30:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/bluez_utils: fix build with
 kernel >= 5.2
In-Reply-To: <20190715163755.2052-1-fontaine.fabrice@gmail.com>
References: <20190715163755.2052-1-fontaine.fabrice@gmail.com>
Message-ID: <20190718223015.34a76cb8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Jul 2019 18:37:55 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/72b6039ee4ba28e67d5ffcb5073e669e8d740e14
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...x-build-after-y2038-changes-in-glibc.patch | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 package/bluez_utils/0006-tools-Fix-build-after-y2038-changes-in-glibc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

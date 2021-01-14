From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Jan 2021 22:33:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/rhash: fix build with uclinux
In-Reply-To: <20210114074803.125721-1-fontaine.fabrice@gmail.com>
References: <20210114074803.125721-1-fontaine.fabrice@gmail.com>
Message-ID: <20210114223331.5c7978e6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 14 Jan 2021 08:48:03 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/598ca65cf0c7ecf9ceaecb75868b656570ae00d2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0002-configure-add-uclinux-target.patch   | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/rhash/0002-configure-add-uclinux-target.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

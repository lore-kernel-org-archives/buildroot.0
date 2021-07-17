From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Jul 2021 10:05:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/keepalived: fix build with
 kernel >= 5.13
In-Reply-To: <20210701222638.810809-1-fontaine.fabrice@gmail.com>
References: <20210701222638.810809-1-fontaine.fabrice@gmail.com>
Message-ID: <20210717100522.672aeda7@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri,  2 Jul 2021 00:26:38 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/9a93d7d76b0a4319c29fbf7b5986bcc78539ae8b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-core-Fix-compiling-on-RHEL-9.patch   | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/keepalived/0001-core-Fix-compiling-on-RHEL-9.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

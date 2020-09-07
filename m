From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 23:13:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/collectd: fix netlink with musl
In-Reply-To: <20200906123329.2832081-1-fontaine.fabrice@gmail.com>
References: <20200906123329.2832081-1-fontaine.fabrice@gmail.com>
Message-ID: <20200907231308.26ddd44d@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Sep 2020 14:33:29 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/cd4d75888b5259b028132dd224be34f69bcbb702
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...001-src-netlink.c-remove-REG_NOERROR.patch | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/collectd/0001-src-netlink.c-remove-REG_NOERROR.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

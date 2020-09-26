From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Sep 2020 15:35:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/read-edid: fix build with gcc 10
In-Reply-To: <20200925214950.3731162-1-fontaine.fabrice@gmail.com>
References: <20200925214950.3731162-1-fontaine.fabrice@gmail.com>
Message-ID: <20200926153501.6488f3b6@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Sep 2020 23:49:50 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/28bde8049b6610273bceae26eca407c819a37dcd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0003-fix-build-with-gcc-10.patch          | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/read-edid/0003-fix-build-with-gcc-10.patch

Applied to master, thanks. This is another package that really isn't
maintained upstream anymore, I'm also not clear about whether it's
still relevant or not these days.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

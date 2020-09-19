From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 23:04:04 +0200
Subject: [Buildroot] [PATCH] meson-tools: fix autobuild failure
In-Reply-To: <20200911093922.8298-1-daggs@gmx.com>
References: <20200911093922.8298-1-daggs@gmx.com>
Message-ID: <20200919230404.62900349@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 11 Sep 2020 12:39:22 +0300
Dagg Stompler <daggs@gmx.com> wrote:

> fix the code so it won't use non std C conevention.
> 
> fixes:
>  - http://autobuild.buildroot.net/results/602d474a12cf2400e4f38ffad903758d7fd9f2f5
>  - http://autobuild.buildroot.net/results/65cfe582ce60fcff18afd008c3d469471ffb0e49
> 
> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> ---
>  ...l-remove-non-std-C-convention-in-for.patch | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 package/meson-tools/0001-amlbootenc-gxl-remove-non-std-C-convention-in-for.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

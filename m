From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Feb 2019 17:01:44 +0100
Subject: [Buildroot] [PATCH] luaexpat: restore getcurrentbytecount
 (required by prosody)
In-Reply-To: <20190219072409.22957-1-francois.perrad@gadz.org>
References: <20190219072409.22957-1-francois.perrad@gadz.org>
Message-ID: <20190223170144.785867e8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 19 Feb 2019 08:24:09 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> fix https://gitlab.com/buildroot.org/buildroot/-/jobs/158295314
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .../0001-restore-getcurrentbytecount.patch    | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/luaexpat/0001-restore-getcurrentbytecount.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

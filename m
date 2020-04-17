From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 22:01:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/fbgrab: bump to version 1.3.3
In-Reply-To: <1587016216-14126-1-git-send-email-timo.ketola@exertus.fi>
References: <1587016216-14126-1-git-send-email-timo.ketola@exertus.fi>
Message-ID: <20200417220148.27681102@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 Apr 2020 08:50:16 +0300
Timo Ketola <timo.ketola@exertus.fi> wrote:

> The pixfmt report bug has been fixed upstream.
> 
> Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>
> ---
>  package/fbgrab/0100-fix-pixfmt-report.patch | 24 ------------------------
>  package/fbgrab/fbgrab.hash                  |  2 +-
>  package/fbgrab/fbgrab.mk                    |  2 +-
>  3 files changed, 2 insertions(+), 26 deletions(-)
>  delete mode 100644 package/fbgrab/0100-fix-pixfmt-report.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

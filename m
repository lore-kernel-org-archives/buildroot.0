From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 14:03:09 +0200
Subject: [Buildroot] [PATCH 1/2] utils/scancpan: add a check of XS
 dependencies in generated test
In-Reply-To: <20190329180525.17320-1-francois.perrad@gadz.org>
References: <20190329180525.17320-1-francois.perrad@gadz.org>
Message-ID: <20190331140309.29218973@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 29 Mar 2019 19:05:24 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> The XS modules have a high propability to fail (compared to Pure Perl modules),
> so it is valuable to check XS dependencies before the check of the main module.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  utils/scancpan | 8 ++++++++
>  1 file changed, 8 insertions(+)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

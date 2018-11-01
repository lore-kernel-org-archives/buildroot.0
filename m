From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 22:22:54 +0100
Subject: [Buildroot] [PATCH] scancpan: print package/Config.in only when
 useful
In-Reply-To: <20181024071056.23683-1-francois.perrad@gadz.org>
References: <20181024071056.23683-1-francois.perrad@gadz.org>
Message-ID: <20181101222254.11988778@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 24 Oct 2018 09:10:56 +0200, Francois Perrad wrote:
> ie. when a new Perl package is added
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  utils/scancpan | 38 ++++++++++++++++++++++----------------
>  1 file changed, 22 insertions(+), 16 deletions(-)

Applied to master after extending the commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

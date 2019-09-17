From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 22:51:11 +0200
Subject: [Buildroot] [PATCH] utils/scancpan: improve license file
 detection
In-Reply-To: <20190916190434.22497-1-francois.perrad@gadz.org>
References: <20190916190434.22497-1-francois.perrad@gadz.org>
Message-ID: <20190917225111.04f08a62@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 16 Sep 2019 21:04:34 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> MANIFEST may contains line like this:
> "LICENSE                     LICENSE file (added by Distar)"
> so, retains only the first word.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  utils/scancpan | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

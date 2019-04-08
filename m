From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Apr 2019 22:38:47 +0200
Subject: [Buildroot] [PATCH 1/1] boot/barebox.hash: add missing newline
 at EOF
In-Reply-To: <20190408191748.17472-1-b.bilas@grinn-global.com>
References: <20190408191748.17472-1-b.bilas@grinn-global.com>
Message-ID: <20190408223847.2f50fa88@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  8 Apr 2019 21:17:48 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> Fixes:
>    boot/barebox/barebox.hash:5: missing newline at end of file
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  boot/barebox/barebox.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

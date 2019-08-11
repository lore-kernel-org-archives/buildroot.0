From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 21:03:01 +0200
Subject: [Buildroot] [PATCH] package/mpg123: fix hash
In-Reply-To: <1565547999-23811-1-git-send-email-pjtexier@koncepto.io>
References: <1565547999-23811-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20190811210301.349cdd3b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 11 Aug 2019 20:26:39 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> When bumping to version 1.25.11, an incorrect hash was set.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/454/454bc42053deb84a73ed75dda99ae9015d23da84/
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  package/mpg123/mpg123.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 17:18:28 +0100
Subject: [Buildroot] [PATCH] dl-wrapper: Fix urlencode option never
 being sent to backend
In-Reply-To: <b97d7c67314b9312d4a79aa1a40ec4bd55ed61ff.camel@vitec.com>
References: <b97d7c67314b9312d4a79aa1a40ec4bd55ed61ff.camel@vitec.com>
Message-ID: <20181209171828.341dbfe3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 7 Dec 2018 12:41:08 +0000, Damien Th?bault wrote:
> The urlencode parameter is lost in dl-wrapper, because we try to get it
> from backend instead of backend_urlencode.
> 
> We must get the urlencode information from backend_urlencode.
> 
> Signed-off-by: Damien Th?bault <damien.thebault@vitec.com>
> ---
>  support/download/dl-wrapper | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

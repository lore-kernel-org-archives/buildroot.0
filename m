From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Dec 2018 11:47:30 +0100
Subject: [Buildroot] [PATCH] libopenssl: Use HTTPS for URL
In-Reply-To: <20181210100635.7611-1-joel@jms.id.au>
References: <20181210100635.7611-1-joel@jms.id.au>
Message-ID: <20181210114730.3035dac3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Dec 2018 20:36:35 +1030, Joel Stanley wrote:
> The host forces HTTPS regardless. This can be seen in the build logs:
> 
>  >>> host-libopenssl 1.0.2q Downloading  
>  URL transformed to HTTPS due to an HSTS policy
>  --2018-12-10 09:53:27--  https://www.openssl.org/source/openssl-1.0.2q.tar.gz
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  package/libopenssl/libopenssl.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

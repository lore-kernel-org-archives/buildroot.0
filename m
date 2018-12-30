From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 16:32:42 +0100
Subject: [Buildroot] [PATCH 1/1] msmtp: invert gnutls/openssl preference
In-Reply-To: <20181229153157.3432-1-bluemrp9@gmail.com>
References: <20181229153157.3432-1-bluemrp9@gmail.com>
Message-ID: <20181230163242.51b9c8be@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Dec 2018 07:31:57 -0800, Ryan Coe wrote:
> Msmtp no longer uses openssl as default [1]. If the configuration has both
> libraries, gnutls should be preferred over openssl.
> 
> [1] https://marlam.de/msmtp/news/openssl-discouraged/
> 
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> ---
>  package/msmtp/msmtp.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

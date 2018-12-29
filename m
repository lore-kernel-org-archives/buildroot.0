From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Dec 2018 10:40:10 +0100
Subject: [Buildroot] [PATCH 1/1] msmtp: fix configure with openssl/gnutls
In-Reply-To: <20181229012134.2037-1-bluemrp9@gmail.com>
References: <20181229012134.2037-1-bluemrp9@gmail.com>
Message-ID: <20181229104010.75627da4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ryan,

Thanks for this patch.

On Fri, 28 Dec 2018 17:21:34 -0800, Ryan Coe wrote:
> Msmtp no longer uses openssl as default [1]. The configure options have
> changed from --use-ssl to --use-tls. As a note, openssl usage is discouraged
> and may be removed in the future.

Then perhaps, as a separate patch, you could invert the gnutls/openssl
preference, so that if both are available, gnutls is used in favor of
openssl ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

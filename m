From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Apr 2021 23:21:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/libupnp: security bump to
 version 1.14.6
In-Reply-To: <20210422072922.63604-1-joerg.krause@embedded.rocks>
References: <20210422072922.63604-1-joerg.krause@embedded.rocks>
Message-ID: <20210423232134.6ccc0b0e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 22 Apr 2021 07:29:22 +0000
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> The server part of pupnp (libupnp) appears to be vulnerable to DNS-rebinding
> attacks because it does not check the value of the `Host` header.
> 
> Fixes CVE-2021-29462
> 
> https://github.com/pupnp/pupnp/security/advisories/GHSA-6hqq-w3jq-9fhg
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/libupnp/libupnp.hash | 2 +-
>  package/libupnp/libupnp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

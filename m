From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 22:48:23 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/quota: add optional openldap dependency
In-Reply-To: <20190401171311.28799-1-fontaine.fabrice@gmail.com>
References: <20190401171311.28799-1-fontaine.fabrice@gmail.com>
Message-ID: <20190401224823.4a895f1b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  1 Apr 2019 19:13:11 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Don't enable openldap in static build because openldap has too many
> optional dependencies (gmp, gnutls, nss, openssl, ...) and openldap
> doesn't provide a pkg-config file (and does not want to do it:
> http://www.openldap.org/lists/openldap-bugs/201406/msg00020.html)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Disable openldap in static build

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

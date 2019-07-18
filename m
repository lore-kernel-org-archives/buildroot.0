From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jul 2019 22:48:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/glib-networking: select openssl
 if gnutls is not enabled
In-Reply-To: <20190714225100.2957-1-fontaine.fabrice@gmail.com>
References: <20190714225100.2957-1-fontaine.fabrice@gmail.com>
Message-ID: <20190718224840.3a633667@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Jul 2019 00:51:00 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/385ab1e09f821facc3d97b7dda6bd8d4a2c98eb5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/glib-networking/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

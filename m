From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 21:53:22 +0100
Subject: [Buildroot] [PATCH] package/libgpgme: properly tweak
 gpgme-config
In-Reply-To: <20181211152425.32525-1-thomas.petazzoni@bootlin.com>
References: <20181211152425.32525-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181213215322.1ebeb286@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Dec 2018 16:24:25 +0100, Thomas Petazzoni wrote:
> libgpgme installs a gpgme-config script, it should be tweaked using
> the <pkg>_CONFIG_SCRIPTS mechanism. This is generally useful and is
> going to be particularly important with per-package directories.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/libgpgme/libgpgme.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

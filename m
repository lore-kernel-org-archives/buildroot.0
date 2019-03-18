From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 22:59:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/keepalived: drop autoreconf
In-Reply-To: <20190318214103.2240-1-fontaine.fabrice@gmail.com>
References: <20190318214103.2240-1-fontaine.fabrice@gmail.com>
Message-ID: <20190318225944.099fba04@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 Mar 2019 22:41:03 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 78d4ddbf3b416885d2e99b32363b174755f9bb30 removed all patches so
> autoreconf is not needed anymore
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/keepalived/keepalived.mk | 2 --
>  1 file changed, 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

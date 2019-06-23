From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 17:19:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/util-linux: minix needs MMU
In-Reply-To: <20190623114053.8775-1-fontaine.fabrice@gmail.com>
References: <20190623114053.8775-1-fontaine.fabrice@gmail.com>
Message-ID: <20190623171953.0b413c5d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 23 Jun 2019 13:40:53 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/87801e1a3c628e00ccb0c57afc2b46cc735c6018
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/util-linux/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

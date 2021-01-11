From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Jan 2021 22:16:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/ed: add ED_CPE_ID_VENDOR
In-Reply-To: <20210111075612.1283686-1-fontaine.fabrice@gmail.com>
References: <20210111075612.1283686-1-fontaine.fabrice@gmail.com>
Message-ID: <20210111221620.687acb09@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Jan 2021 08:56:12 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ed/ed.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks. However, the NIST database only knows about
ed version 0.2, so I suppose it should be filled in with more updates
of ed versions.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

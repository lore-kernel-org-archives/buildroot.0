From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Jan 2021 21:37:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/libupnp: set
 LIBUPNP_CPE_ID_VALID
In-Reply-To: <20210111201441.1414609-1-fontaine.fabrice@gmail.com>
References: <20210111201441.1414609-1-fontaine.fabrice@gmail.com>
Message-ID: <20210111213703.72b52be4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Jan 2021 21:14:41 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libupnp/libupnp.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master after adding more details to the commit log. Note
that we have a strange situation with this package: libupnp is stuck at
1.6.x, libupnp is stuck at 1.8.x, while the latest upstream version
known by the CPE dictionary is 1.12.x.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

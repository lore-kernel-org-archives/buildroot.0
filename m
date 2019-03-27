From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Mar 2019 20:11:02 +0100
Subject: [Buildroot] [PATCH v3,
 1/1] package/keepalived: add optional libnftnl dependency
In-Reply-To: <20190327181248.24658-1-fontaine.fabrice@gmail.com>
References: <20190327181248.24658-1-fontaine.fabrice@gmail.com>
Message-ID: <20190327201102.5b6445b3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 27 Mar 2019 19:12:48 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> nftables support has been added since version 2.0.11 and
> https://github.com/acassen/keepalived/commit/aa12175ea638912a7789e832634d7ccf80fdf48d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3 (after review of Baruch Siach):
>  - Drop libmnl dependency as libnftnl already depends on it

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

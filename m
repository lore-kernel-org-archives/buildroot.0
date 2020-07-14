From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 15:17:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/keepalived: drop --{en,
 dis}able-libiptc option
In-Reply-To: <20200628100122.257040-1-fontaine.fabrice@gmail.com>
References: <20200628100122.257040-1-fontaine.fabrice@gmail.com>
Message-ID: <20200714151709.685df46e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 28 Jun 2020 12:01:22 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> --{en,dis}able-libiptc has been dropped since version 2.1.0 and
> https://github.com/acassen/keepalived/commit/05443e1efa3569fcd39a548c6c78b832b79bcf4e
> 
> So replace it by --{en,dis}able-iptables
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/keepalived/keepalived.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

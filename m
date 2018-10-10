From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 08:58:00 +0200
Subject: [Buildroot] [PATCH 1/1] xerces: don't disable network without
 curl
In-Reply-To: <20181009172519.11571-1-fontaine.fabrice@gmail.com>
References: <20181009172519.11571-1-fontaine.fabrice@gmail.com>
Message-ID: <20181010085800.0ca4516a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Oct 2018 19:25:19 +0200, Fabrice Fontaine wrote:
> curl is not the only network accessor, xerces can also use the socket
> API if sys/socket is available.
> So replace --disable-network by --disable-netaccessor-curl
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/xerces/xerces.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

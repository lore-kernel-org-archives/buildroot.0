From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 21:35:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/docker-containerd: add CPE
 variables
In-Reply-To: <20210121221352.2373527-1-fontaine.fabrice@gmail.com>
References: <20210121221352.2373527-1-fontaine.fabrice@gmail.com>
Message-ID: <20210123213514.74925bbf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 21 Jan 2021 23:13:52 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:linuxfoundation:containerd is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alinuxfoundation%3Acontainerd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/docker-containerd/docker-containerd.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Nov 2014 22:14:45 +0100
Subject: [Buildroot] [PATCH] xl2tp: fix static build
In-Reply-To: <83364a11d5a70fa1d3e52a9d44ea5c118dc3a4fe.1416738599.git.baruch@tkos.co.il>
References: <83364a11d5a70fa1d3e52a9d44ea5c118dc3a4fe.1416738599.git.baruch@tkos.co.il>
Message-ID: <20141124221445.5b799cc0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 23 Nov 2014 12:29:59 +0200, Baruch Siach wrote:
> Use pcap-config to list dependencies of libpcap.
> 
> Fixes:
> http://autobuild.buildroot.net/results/87f/87ff92831d265d437aa0dfcfb99e954f76597761/
> http://autobuild.buildroot.net/results/cd5/cd5487e76259752cbe58b171f9a58970916f7bb8/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/xl2tp/xl2tp.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

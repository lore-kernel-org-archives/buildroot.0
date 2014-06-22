From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 21:54:58 +0200
Subject: [Buildroot] [PATCH] knock: fix static build
In-Reply-To: <642cb02624e2ab6997d7ed7f3a92bc368d69f8e0.1403457796.git.baruch@tkos.co.il>
References: <642cb02624e2ab6997d7ed7f3a92bc368d69f8e0.1403457796.git.baruch@tkos.co.il>
Message-ID: <20140622215458.50582c5f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 22 Jun 2014 20:23:16 +0300, Baruch Siach wrote:
> Use pcap-config to determine link dependencies of libpcap.
> 
> Fixes:
> http://autobuild.buildroot.net/results/1eb/1eb877ebd9469c9261bf114fc7733819ae3fd562/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/knock/knock.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

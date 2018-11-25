From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Nov 2018 09:21:36 +0100
Subject: [Buildroot] [PATCH next] iptables: fix build with kernel
 headers < 3.12
In-Reply-To: <790ee9a3bbc8d37f4a812af831308bc65f128985.1543124799.git.baruch@tkos.co.il>
References: <790ee9a3bbc8d37f4a812af831308bc65f128985.1543124799.git.baruch@tkos.co.il>
Message-ID: <20181125092136.08b21896@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Nov 2018 07:46:39 +0200, Baruch Siach wrote:
> Extend the workaround that was added in patch 0003 to cover ipv6
> definitions.
> 
> Fixes:
> http://autobuild.buildroot.net/results/23f/23ff396a568a865751471bf1f9e5dff2b73c8ab0/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...he-headers-conflict-workaround-to-in.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/iptables/0005-include-extend-the-headers-conflict-workaround-to-in.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

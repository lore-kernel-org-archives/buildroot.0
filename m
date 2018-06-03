From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 3 Jun 2018 20:25:58 +0200
Subject: [Buildroot] [PATCH 1/1] zmqpp: depends on exception_ptr
In-Reply-To: <20180603101114.12722-1-fontaine.fabrice@gmail.com>
References: <20180603101114.12722-1-fontaine.fabrice@gmail.com>
Message-ID: <20180603202558.712a1495@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Jun 2018 12:11:14 +0200, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.net/results/20475346bfcb0cff019ad2e98a0e0ab432a6e5bf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/zmqpp/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

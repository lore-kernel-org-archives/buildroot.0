From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 May 2018 09:16:08 +0200
Subject: [Buildroot] [PATCH] openvpn: bump to version 2.4.6
In-Reply-To: <a8ecc558bbd852aa168aa2b59e7f1fc4e1b2c5ec.1525407395.git.baruch@tkos.co.il>
References: <a8ecc558bbd852aa168aa2b59e7f1fc4e1b2c5ec.1525407395.git.baruch@tkos.co.il>
Message-ID: <20180504091608.79401b1c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  4 May 2018 07:16:35 +0300, Baruch Siach wrote:
> Note that CVE-2018-9336 fixed in this version does not affect Buildroot
> since it is Windows specific.
> 
> Drop interoperability with older busybox versions. We removed support
> for busybox version selection long ago.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/openvpn/openvpn.hash |  2 +-
>  package/openvpn/openvpn.mk   | 15 +++------------
>  2 files changed, 4 insertions(+), 13 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

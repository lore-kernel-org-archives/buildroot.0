From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 23:22:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.55
In-Reply-To: <20200911064352.220841-1-joerg.krause@embedded.rocks>
References: <20200911064352.220841-1-joerg.krause@embedded.rocks>
Message-ID: <20200919232230.24145d26@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 11 Sep 2020 08:43:52 +0200
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Add a config option to explicitly enable the hid2hci tool, which is not
> build by default anymore.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/bluez5_utils-headers/bluez5_utils-headers.mk | 2 +-
>  package/bluez5_utils/Config.in                       | 9 +++++++++
>  package/bluez5_utils/bluez5_utils.hash               | 2 +-
>  package/bluez5_utils/bluez5_utils.mk                 | 9 ++++++++-
>  4 files changed, 19 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Jan 2018 10:14:45 +0100
Subject: [Buildroot] [PATCH v2] eeprog: remove package
In-Reply-To: <2647f36b9fbe9f718b30aa984c2c488f7cf6bc9c.1514873761.git.baruch@tkos.co.il>
References: <2647f36b9fbe9f718b30aa984c2c488f7cf6bc9c.1514873761.git.baruch@tkos.co.il>
Message-ID: <20180102101445.5c39e076@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Jan 2018 08:16:01 +0200, Baruch Siach wrote:
> The i2c-tools package has adopted the code of eeprog.
> 
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2:
>   Select BR2_LEGACY (Thomas)
>   Select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS to make sure i2c-tools is
>   enabled (Thomas)
> ---
>  Config.in.legacy           |  8 ++++++++
>  DEVELOPERS                 |  1 -
>  package/Config.in          |  1 -
>  package/eeprog/Config.in   |  6 ------
>  package/eeprog/eeprog.hash |  2 --
>  package/eeprog/eeprog.mk   | 20 --------------------
>  6 files changed, 8 insertions(+), 30 deletions(-)
>  delete mode 100644 package/eeprog/Config.in
>  delete mode 100644 package/eeprog/eeprog.hash
>  delete mode 100644 package/eeprog/eeprog.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

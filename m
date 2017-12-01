From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 23:09:53 +0100
Subject: [Buildroot] [PATCH v2] rtl8723bu: new package
In-Reply-To: <20171127090119.32215-1-mylene.josserand@free-electrons.com>
References: <20171127090119.32215-1-mylene.josserand@free-electrons.com>
Message-ID: <20171201230953.165bcae9@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Nov 2017 10:01:19 +0100, Myl?ne Josserand wrote:
> Add RTL8723BU package to compile the Realtek RTL8723BU Wifi driver.
> 
> Signed-off-by: Myl?ne Josserand <mylene.josserand@free-electrons.com>
> 
> ---
> Changes since v1:
> 	- Added myself into DEVELOPERS file
> 	- Removed the loop to install the firmware (not necessary)
> 	- Updated the installation to remove the hook and use standard
> 	INSTALL_TARGET_CMDS
> ---
>  DEVELOPERS                       |  3 +++
>  package/Config.in                |  1 +
>  package/rtl8723bu/Config.in      | 10 ++++++++++
>  package/rtl8723bu/rtl8723bu.hash |  2 ++
>  package/rtl8723bu/rtl8723bu.mk   | 20 ++++++++++++++++++++
>  5 files changed, 36 insertions(+)
>  create mode 100644 package/rtl8723bu/Config.in
>  create mode 100644 package/rtl8723bu/rtl8723bu.hash
>  create mode 100644 package/rtl8723bu/rtl8723bu.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

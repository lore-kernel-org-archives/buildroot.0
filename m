From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 15:14:13 +0200
Subject: [Buildroot] [PATCH v4] igd2-for-linux: new package
In-Reply-To: <1469102757-1981-1-git-send-email-fabrice.fontaine@orange.com>
References: <1469102757-1981-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20160724151413.0b532ad7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Jul 2016 14:05:57 +0200, Fabrice Fontaine wrote:
> This is The Linux UPnP Internet Gateway Device 2. It is
> modified from the original Linux UPnP Internet Gateway Device
> [http://linux-igd.sourceforge.net/] according to UPnP
> InternetGatewayDevice:2 specifications.
> 
> It implements the UPnP Internet Gateway Device version 2
> specification (IGDv2) and allows UPnP aware clients, such as
> MSN Messenger, Azureus or Miranda to work properly from behind
> a NAT firewall.
> 
> Please edit /etc/upnpd.conf before using upnpd!
> 
> https://github.com/ffontaine/igd2-for-linux
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> ---
> Changes v3 -> v4 (after review of Thomas Petazzoni):
>  - Allow modification of LAN and WAN interfaces by sourcing
>    /etc/default/upnpd in init scripts
>  - Do not add UPnP multicast route by default
>  - Fix indentation of IGD2_FOR_LINUX_BUILD_CMDS
>  - Simplify file installation in IGD2_FOR_LINUX_INSTALL_TARGET_CMDS
>  - Replace wrong reference to domoticz by igd2-for-linux

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

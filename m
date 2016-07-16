From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 20:15:01 +0200
Subject: [Buildroot] [PATCH 1/1] igd2-for-linux: new package
In-Reply-To: <1467905712-3559-1-git-send-email-fabrice.fontaine@orange.com>
References: <1467905712-3559-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20160716201501.4975cbfa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Jul 2016 17:35:12 +0200, Fabrice Fontaine wrote:
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

Following the comments from Romain Naour, I've marked your patch as
"Changes Requested" in our patch tracking system. Could you respin a
new version that takes into account Romain's comments?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

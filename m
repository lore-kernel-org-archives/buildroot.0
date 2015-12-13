From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 14:11:52 +0100
Subject: [Buildroot] [PATCH 1/2] package/wireshark: Fix libpcap detection
In-Reply-To: <1449998185-15082-1-git-send-email-bernd.kuhls@t-online.de>
References: <1449998185-15082-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151213141152.6e92e7ce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 13 Dec 2015 10:16:24 +0100, Bernd Kuhls wrote:
> To reproduce the build error I had to install libpcap0.8-dev on my host
> system, then wireshark configure picks up
> 
> checking for pcap-config... /usr/bin/pcap-config
> 
> and fails.
> 
> Fixes
> http://autobuild.buildroot.net/results/7e3/7e363d18866057df0db3d0d95fa8d9116728f6ce//
> and many others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/wireshark/wireshark.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

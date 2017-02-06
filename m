From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 14:00:56 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/sngrep: fix static linking
 against libpcap
In-Reply-To: <20170129172438.23835-1-bernd.kuhls@t-online.de>
References: <20170129172438.23835-1-bernd.kuhls@t-online.de>
Message-ID: <20170206140056.17dcb4fd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Jan 2017 18:24:38 +0100, Bernd Kuhls wrote:
> Inspired by
> https://git.buildroot.net/buildroot/tree/package/aircrack-ng/aircrack-ng.mk#n30
> 
> Fixes
> http://autobuild.buildroot.net/results/699/6993c398649469e25f2491fdb8f1ac9b6d6d8c3c/
> http://autobuild.buildroot.net/results/846/8468df3462ac6d53faef228ca241bc500b2d7a52/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: optimized pcap-config call (Thomas)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

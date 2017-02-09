From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 21:33:48 +0100
Subject: [Buildroot] [PATCH 5/6] package/mpd: affected by GCC PR
 libstdc++/64735
In-Reply-To: <20170209174759.15819-6-joerg.krause@embedded.rocks>
References: <20170209174759.15819-1-joerg.krause@embedded.rocks>
 <20170209174759.15819-6-joerg.krause@embedded.rocks>
Message-ID: <20170209213348.22f71191@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Feb 2017 18:47:58 +0100, J?rg Krause wrote:
> MPD uses `exception_ptr` from libstdc++ which is not available for
> architectures affected by GCC PR libstdc++/64735.
> 
> Fixes:
> http://autobuild.buildroot.net/results/552/552e0c4d6482b60045a91fd398c4ffecd8877cce/
> http://autobuild.buildroot.net/results/4d3/4d384950b6dba21163bdcd7721ddad133beeb72b/
> http://autobuild.buildroot.net/results/842/842e992315dd78765938e6b629386a18fa9bb00c/
> .. and many more.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/mpd/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

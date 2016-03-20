From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 15:09:29 +0100
Subject: [Buildroot] [PATCH 1/3] package/multicat: add patch to fix
 static build
In-Reply-To: <1458430906-8291-1-git-send-email-joerg.krause@embedded.rocks>
References: <1458430906-8291-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160320150929.79e3d1fd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg,

On Sun, 20 Mar 2016 00:41:44 +0100, J?rg Krause wrote:
> Building multicat in a static context fails with:
>   aggregartp.c:381: undefined reference to `pthread_self'
> 
> Fix this by adding -lpthread to LDLIBS.
> 
> Fixes:
> http://autobuild.buildroot.net/results/e69/e699cf6b97bc97f2e8e51aa8b86f0e16af70b5b0/
> http://autobuild.buildroot.net/results/201/2019f11dcc43cb0db13ceb4e3a575c1a91573d4c/
> http://autobuild.buildroot.net/results/fa9/fa98afec377a1e8fce64af5897d1f7af45804069/
> and maybe more.
> 
> Upstream status: Pending [1]
> 
> [1] https://mailman.videolan.org/pipermail/multicat-devel/2016-March/000125.html

This info would be useful to have in the patch itself, so I've added it
and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 10:01:18 +0100
Subject: [Buildroot] [PATCH 1/2] package/prboom: disable for Sourcery
 CodeBench SH 2012.09
In-Reply-To: <1458588788-13625-1-git-send-email-joerg.krause@embedded.rocks>
References: <1458588788-13625-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160322100118.4828d541@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Mar 2016 20:33:07 +0100, J?rg Krause wrote:
> Building prboom with the external Sourcery CodeBench SH 2012.09 toolchain
> fails with an internal compiler error:
> 
> r_fps.c: In function 'R_StopAllInterpolations':
> r_fps.c:296:1: internal compiler error: Segmentation fault
> 
> Make the toolchain unavailable for building prboom.
> 
> Fixes:
> http://autobuild.buildroot.net/results/2f1/2f14075e22b420cc3fdaaa2231494f2829f040ec/
> http://autobuild.buildroot.net/results/d30/d3030fea0b3b8693be640754774e50ac064f8c89/
> http://autobuild.buildroot.net/results/b5b/b5b90a03fc47f3771803cb474e0ea9671b5c4667/
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/prboom/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Both applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 13:58:58 +0200
Subject: [Buildroot] [PATCH] ola: mark as broken
In-Reply-To: <78a929f7208b78d17f45d4ddb8bc8df7f26ba74b.1493388478.git.baruch@tkos.co.il>
References: <78a929f7208b78d17f45d4ddb8bc8df7f26ba74b.1493388478.git.baruch@tkos.co.il>
Message-ID: <20170429135858.31524bb1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Apr 2017 17:07:58 +0300, Baruch Siach wrote:
> Build with current protobuf is broken. Mark as broken until upstream resolves
> this issue.
> 
> https://github.com/OpenLightingProject/ola/issues/1192
> 
> Fixes:
> http://autobuild.buildroot.net/results/d9a/d9a24f7b715100be1580a568a5e3ff72b0389165/
> http://autobuild.buildroot.net/results/b31/b314811dedce04ebdc779df67de6cb59a1880cac/
> http://autobuild.buildroot.net/results/587/5877b2301b7da43c50127a4c5f648acd3b0264cc/
> 
> Cc: Dave Skok <blanco.ether@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/ola/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

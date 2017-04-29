From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 15:44:00 +0200
Subject: [Buildroot] [PATCH] protobuf: fix musl build
In-Reply-To: <703712d685c4c0e1459af8b8d3a0fcbd80a87c85.1493324348.git.baruch@tkos.co.il>
References: <703712d685c4c0e1459af8b8d3a0fcbd80a87c85.1493324348.git.baruch@tkos.co.il>
Message-ID: <20170429154400.4f6fb629@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Apr 2017 23:19:08 +0300, Baruch Siach wrote:
> Add upstream patch fixing conflict with musl defined major/minor macros.
> 
> Fixes:
> http://autobuild.buildroot.net/results/fc5/fc5ea266eecb6ecab011ea3542f0bb680fb8fb3b/
> http://autobuild.buildroot.net/results/3b3/3b3fe16978f19e65a6c6dc1712d72cb349eed0d5/
> http://autobuild.buildroot.net/results/1da/1dac9d5e49342700036c90ed4785fff7398b8966/
> 
> Cc: Mario J. Rugiero <mrugiero@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/protobuf/protobuf.hash | 1 +
>  package/protobuf/protobuf.mk   | 2 ++
>  2 files changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

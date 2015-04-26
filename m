From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 14:29:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/tor: limit libseccomp support
 to archs supported by upstream
In-Reply-To: <1430044186-17979-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430044186-17979-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150426142942.01db0846@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 26 Apr 2015 12:29:46 +0200, Bernd Kuhls wrote:
> See this commit for a list of supported archs:
> https://gitweb.torproject.org/tor.git/commit/src/common/sandbox.c?id=b0c1c700114aa8d4dfc180d85870c5bbe15fcacb
> 
> Fixes mips64el build error:
> http://autobuild.buildroot.net/results/f97/f9792a0b013f6b79774ecc978d859f56bd941586/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/tor/tor.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

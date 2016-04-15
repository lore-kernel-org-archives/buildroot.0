From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 09:43:05 +0200
Subject: [Buildroot] [PATCH] luvi: bump to version 2.7.0
In-Reply-To: <1460704407-6230-1-git-send-email-joerg.krause@embedded.rocks>
References: <1460704407-6230-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160415094305.030e2214@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Apr 2016 09:13:27 +0200, J?rg Krause wrote:
> Add a patch from upstream [1] to fix CMake build error when building with option
> "WithSharedLibluv=ON".
> 
> [1]
> https://github.com/luvit/luvi/commit/35c3961d10d3f9e3752102ea8e8bb8c187b32241
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/luvi/luvi.hash | 3 ++-
>  package/luvi/luvi.mk   | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

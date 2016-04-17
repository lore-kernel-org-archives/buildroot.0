From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Apr 2016 16:45:55 +0200
Subject: [Buildroot] [PATCH] luvi: bump to version 2.7.0
In-Reply-To: <1460793020-9852-1-git-send-email-joerg.krause@embedded.rocks>
References: <1460793020-9852-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160417164555.32619a09@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Apr 2016 09:50:20 +0200, J?rg Krause wrote:
> Fetch a patch from upstream [1] to fix CMake build error when building with
> option "WithSharedLibluv=ON".
> 
> [1] https://github.com/luvit/luvi/commit/35c3961d10d3f9e3752102ea8e8bb8c187b32241
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

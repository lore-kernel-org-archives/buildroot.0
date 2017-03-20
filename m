From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 21:52:09 +0100
Subject: [Buildroot] [PATCH] skalibs: fix endianness detection on x86
In-Reply-To: <20170320201122.26539-1-eric.le.bihan.dev@free.fr>
References: <20170320201122.26539-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170320215209.2e45c696@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Mar 2017 21:11:22 +0100, Eric Le Bihan wrote:
> Update the patch for compile time endianness detection so it works on
> x86 platforms using GCC <= 4.4.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/c2e8e1180571976b412cbba729c45a3698aea0b2
>   http://autobuild.buildroot.net/results/2ee47107d8a67470f7bc3e10cf763202d5455d17
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  .../skalibs/0001-No-runtime-tests-for-endianness.patch  | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

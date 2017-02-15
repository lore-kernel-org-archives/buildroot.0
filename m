From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 21:55:30 +0100
Subject: [Buildroot] [PATCH] cannelloni: fix build failure caused by
 missing include
In-Reply-To: <1487158690-2977-1-git-send-email-yegorslists@googlemail.com>
References: <1487158690-2977-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20170215215530.522e373a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Feb 2017 12:38:10 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Add a patch, that explicitly includes cstdio header.
> 
> Fixes:
> http://autobuild.buildroot.net/results/82d/82d1dca3aa7ee9189baae985db59464d95696ed7/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  .../0001-Add-missing-cstdio-include.patch          | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/cannelloni/0001-Add-missing-cstdio-include.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

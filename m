From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2016 22:50:12 +0100
Subject: [Buildroot] [PATCH] package/gcc: fix ICE on xtensa, 6.2,
 PR target/78118
In-Reply-To: <1480462611-19531-1-git-send-email-jcmvbkbc@gmail.com>
References: <1480462611-19531-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20161130225012.10db446b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Nov 2016 15:36:51 -0800, Max Filippov wrote:
> This fixes gcc build for xtensa configurations with call0 ABI.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  .../gcc/6.2.0/870-xtensa-Fix-PR-target-78118.patch | 320 +++++++++++++++++++++
>  1 file changed, 320 insertions(+)
>  create mode 100644 package/gcc/6.2.0/870-xtensa-Fix-PR-target-78118.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 18:21:35 +0100
Subject: [Buildroot] [PATCH] package/mono: add threads dependency
In-Reply-To: <1414764111-21739-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1414764111-21739-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20141101182135.657f22ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Fri, 31 Oct 2014 15:01:51 +0100, Angelo Compagnucci wrote:
> This patch adds a depends on BR2_TOOLCHAIN_HAS_THREADS.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  package/mono/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Thanks, applied, after adding the autobuilder references mentioned by
Yann.

And thanks Angelo for looking by yourself at the mono autobuilder
failures. It's much appreciated!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

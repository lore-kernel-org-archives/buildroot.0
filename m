From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 21:23:45 +0100
Subject: [Buildroot] [PATCH 1/1] util-linux: rename patches to follow
 the new name convention
In-Reply-To: <1418217249-55637-1-git-send-email-kaszak@gmail.com>
References: <1418217249-55637-1-git-send-email-kaszak@gmail.com>
Message-ID: <20141210212345.79a0c624@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Karoly Kasza,

On Wed, 10 Dec 2014 14:14:09 +0100, Karoly Kasza wrote:
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> ---
>  ...{util-linux-001-sscanf-no-ms-as.patch => 001-sscanf-no-ms-as.patch} |    0
>  ...cation-short-name.patch => 002-program-invocation-short-name.patch} |    0
>  ...patch => 003-c.h-define-mkostemp-for-older-version-of-uClibc.patch} |    0
>  3 files changed, 0 insertions(+), 0 deletions(-)

Thanks, but Gustavo also sent another similar patch, which included a
fix for a CVE security issue, so I took Gustavo's patch instead.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

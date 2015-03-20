From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 20:32:35 +0100
Subject: [Buildroot] [PATCH] package/uclibc: fix linuxthreads symbol
 typos
In-Reply-To: <1426637970-27436-1-git-send-email-jcmvbkbc@gmail.com>
References: <1426637970-27436-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20150320203235.62497d2c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Wed, 18 Mar 2015 03:19:30 +0300, Max Filippov wrote:
> BR2_UCLIBC_VERSION_XTENSA_GIT and BR2_UCLIBC_VERSION_SNAPSHOT select
> BR2_UCLIBC_SUPPORTS_* instead of new BR2_UCLIBC_VERSION_SUPPORTS_*.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/uclibc/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

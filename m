From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 22:12:13 +0200
Subject: [Buildroot] [PATCH] erlang: Remove BR2_TOOLCHAIN_HAS_THREADS
 dependency
In-Reply-To: <1445349286-1185-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1445349286-1185-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20151021221213.314eb654@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Tue, 20 Oct 2015 10:54:46 -0300, Ezequiel Garcia wrote:
> Erlang can be built without threads support, by passing an
> appropriate config option.
> 
> This commit drops the config dependency on BR2_TOOLCHAIN_HAS_THREADS
> and instead passes --disable-threads if the toolchain doesn't support
> threads.
> 
> While here, change the wording of the config comment to "dynamic
> library" to be consistent with similar comments elsewhere.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  package/erlang/Config.in | 5 ++---
>  package/erlang/erlang.mk | 4 ++++
>  2 files changed, 6 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

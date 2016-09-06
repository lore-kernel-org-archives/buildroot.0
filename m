From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 21:51:37 +0200
Subject: [Buildroot] [PATCH 4/9] package/terminology: remove elementary
 dependency
In-Reply-To: <1472848295-13734-4-git-send-email-romain.naour@gmail.com>
References: <1472848295-13734-1-git-send-email-romain.naour@gmail.com>
 <1472848295-13734-4-git-send-email-romain.naour@gmail.com>
Message-ID: <20160906215137.0a7cf9bc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Sep 2016 22:31:30 +0200, Romain Naour wrote:
> elementary is now provided by efl package, so remove elementary package
> dependency.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/terminology/Config.in      | 1 -
>  package/terminology/terminology.mk | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

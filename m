From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 21:51:34 +0200
Subject: [Buildroot] [PATCH 3/9] package/enlightenment: remove
 libevas-generic-loaders dependency
In-Reply-To: <1472848295-13734-3-git-send-email-romain.naour@gmail.com>
References: <1472848295-13734-1-git-send-email-romain.naour@gmail.com>
 <1472848295-13734-3-git-send-email-romain.naour@gmail.com>
Message-ID: <20160906215134.7531cfc5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Sep 2016 22:31:29 +0200, Romain Naour wrote:
> libevas-generic-loaders is now provided by efl package, so remove
> libevas-generic-loaders package dependency.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/enlightenment/Config.in        | 3 +--
>  package/enlightenment/enlightenment.mk | 1 -
>  2 files changed, 1 insertion(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

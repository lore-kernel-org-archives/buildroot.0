From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 14:54:46 +0100
Subject: [Buildroot] [PATCH] bind: bump to version 9.10.3-P2
In-Reply-To: <1451482769-15603-1-git-send-email-gustavo@zacarias.com.ar>
References: <1451482769-15603-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151230145446.1307ccc7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 30 Dec 2015 10:39:29 -0300, Gustavo Zacarias wrote:
> Leave the LTS series for the latest stable version for libressl
> compatibility.
> Unfortunately this means threads are now required, but this shouldn't be
> a problem for a fully-featured resolver.
> 
> Drop 0001-disable-tests.patch since it's no longer required, genrandom
> isn't run unless the tests are called upon.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/bind/0001-disable-tests.patch | 28 ----------------------------
>  package/bind/Config.in                |  5 +++--
>  package/bind/bind.hash                |  4 ++--
>  package/bind/bind.mk                  |  9 ++++++++-
>  4 files changed, 13 insertions(+), 33 deletions(-)
>  delete mode 100644 package/bind/0001-disable-tests.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

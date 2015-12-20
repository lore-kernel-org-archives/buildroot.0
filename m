From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 22:51:04 +0100
Subject: [Buildroot] [PATCH] start-stop-daemon: bump to version 1.18.3
In-Reply-To: <1450645384-19542-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450645384-19542-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151220225104.006f980a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 20 Dec 2015 18:03:04 -0300, Gustavo Zacarias wrote:
> Enable developer mode to skip the shared library check in configure and
> avoid further patching.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../0001-add-uclibc-alias-and-musl.patch           | 28 +++++++---------------
>  package/start-stop-daemon/start-stop-daemon.hash   |  4 ++--
>  package/start-stop-daemon/start-stop-daemon.mk     |  7 +++---
>  3 files changed, 14 insertions(+), 25 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

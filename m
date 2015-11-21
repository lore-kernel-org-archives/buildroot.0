From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Nov 2015 09:32:10 +0100
Subject: [Buildroot] [PATCH 2/2] libnss: bump to version 3.21
In-Reply-To: <1448045240-23847-2-git-send-email-gustavo@zacarias.com.ar>
References: <1448045240-23847-1-git-send-email-gustavo@zacarias.com.ar>
 <1448045240-23847-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151121093210.77ddf8e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 20 Nov 2015 15:47:20 -0300, Gustavo Zacarias wrote:
> Disable gtests since they require C++ support.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libnss/libnss.hash | 4 ++--
>  package/libnss/libnss.mk   | 3 ++-
>  2 files changed, 4 insertions(+), 3 deletions(-)

I've applied to next. However, there was a conflict since you based
your patch on master where libnss has been bumped to 3.20.1. But in
next, the libnss version is still 3.20. I've fixed that up when
applying.

Peter: this means you will get a conflict when merging back next into
master, but it is trivial to resolve (hash file conflict and
<pkg>_VERSION conflict).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

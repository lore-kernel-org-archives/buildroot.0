From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 10:14:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/exim: Dependency host-pkgconf
 is only needed for OpenSSL detection
In-Reply-To: <1429210360-4753-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429210360-4753-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150419101450.6ee0319e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu, 16 Apr 2015 20:52:40 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/exim/exim.mk |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Following the feedback from Yann, who suggested to keep the dependency
unconditional, I marked your patch as Rejected in patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

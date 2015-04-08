From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 21:28:27 +0200
Subject: [Buildroot] [PATCH] socat: security bump to version 2.0.0-b8
In-Reply-To: <1428510106-26897-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428510106-26897-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150408212827.288a415c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed,  8 Apr 2015 13:21:46 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2015-1379 - signal handler implementations are not async-signal-safe
> and can cause crash or freeze of socat processes.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/socat/socat.hash | 2 ++
>  package/socat/socat.mk   | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>  create mode 100644 package/socat/socat.hash

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

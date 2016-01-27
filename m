From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 21:37:18 +0100
Subject: [Buildroot] [PATCH] nginx: security bump to version 1.8.1
In-Reply-To: <1453896210-19099-1-git-send-email-gustavo@zacarias.com.ar>
References: <1453896210-19099-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160127213718.6339e906@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 27 Jan 2016 09:03:30 -0300, Gustavo Zacarias wrote:
> Fixes:
> 
> CVE-2016-0742 - invalid pointer dereference might occur during DNS
> server response processing if the "resolver" directive was used,
> allowing anattacker who is able to forge UDP packets from the DNS server
> to cause segmentation fault in a worker process.
> 
> CVE-2016-0746 - use-after-free condition might occur during CNAME
> response processing if the "resolver" directive was used, allowing an
> attacker who is able to trigger name resolution to cause segmentation
> fault in a worker process, or might have potential other impact.
> 
> CVE-2016-0747 - CNAME resolution was insufficiently limited if the
> "resolver" directive was used, allowing an attacker who is able to
> trigger arbitrary name resolution to cause excessive resource
> consumption in worker processes.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/nginx/nginx.hash | 2 +-
>  package/nginx/nginx.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Apr 2015 09:47:15 +0200
Subject: [Buildroot] [PATCH] libtirpc: fix build failure after non-IPv6
 disabled
In-Reply-To: <1429764258-17941-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429764258-17941-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150423094715.6ffd7b52@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 23 Apr 2015 01:44:18 -0300, Gustavo Zacarias wrote:
> Adjust patch 0005 to account for the removed optional IPv6 support
> patch, since otherwise it won't apply. Fixes:
> http://autobuild.buildroot.net/results/0ad/0ad8c9e331190f72280c3a1e3cd8d42728f818de/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../0005-Automatically-generate-XDR-header-files-from-.x-sour.patch    | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
